//
//  LocationVC.swift
//  Boxeyi
//
//  Created by talha on 04/10/2019.
//  Copyright © 2019 Boxeyi. All rights reserved.
//

import UIKit
import MapKit
import GoogleMaps
import GooglePlaces
import CoreLocation

class LocationVC: UIViewController {

    @IBOutlet weak var gmapView: GMSMapView!
    //Buttons
    @IBOutlet weak var dismissBtnOutlet: UIButton!
    @IBOutlet weak var searchBtnOutlet: UIButton!
    
    //Location Manager
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.setUpLocationManagerDelegate()
      
      
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        self.gmapView.delegate = self
        self.gmapView.isMyLocationEnabled = true
    }
    
    

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.4, delay: 0.1, options: .curveEaseOut, animations: {
            self.dismissBtnOutlet.frame.origin.x = 20
            self.searchBtnOutlet.frame.origin.x = self.view.frame.width - 70
        }, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        UIView.animate(withDuration: 0.4, delay: 0.1, options: .curveEaseOut, animations: {
            self.dismissBtnOutlet.frame.origin.x = -50
            self.searchBtnOutlet.frame.origin.x = -50
        }, completion: nil)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.dismissBtnOutlet.getRoundedcorner(cornerRadius: self.dismissBtnOutlet.roundWidth())
        self.searchBtnOutlet.getRoundedcorner(cornerRadius: self.searchBtnOutlet.roundWidth())
        
    }
    
}


extension LocationVC{
    
    @IBAction func dismissAction(_ sender: Any) {
        self.view.endEditing(true)
        
        UIView.animate(withDuration: 0.2, delay: 0.1, options: .curveEaseOut, animations: {
        
            self.dismissBtnOutlet.frame.origin.x = -50
            self.searchBtnOutlet.frame.origin.x = self.view.frame.width + 50
        }) { (val) in
              self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func serchPlaceAction(_ sender: Any) {
        
    }
}


extension LocationVC : StoryboardInitializable {
    
    public static var storyboardName: UIStoryboard.Storyboard {
        
        return UIStoryboard.Storyboard.location
    }
    
}

//Location Manager
extension LocationVC : CLLocationManagerDelegate {
    
    fileprivate func setUpLocationManagerDelegate(){
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let lat  = locations.last?.coordinate.latitude, let long = locations.last?.coordinate.longitude{
            print("\n\nThe current Lat/Long Is Here\n\n")
            let coordinates = CLLocationCoordinate2D(latitude: lat, longitude: long)
            self.getCurrentPostion(coordinates, 15)
        }else{
            print("Unable To Access Locaion")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        switch status {
        case .authorizedAlways,.authorizedWhenInUse:
            print("Good to go and use location")
            locationManager.startUpdatingLocation()
            
        case .denied:
            print("DENIED to go and use location")
            
        case .restricted:
            print("RESTRICTED to go and use location")
            
        case .notDetermined:
            print("NOT DETERMINED to go and use location")
            
            
        default:
            print("Unable to read location :\(status)")
        }
    }
    
    
}


//Google Maps Location
extension LocationVC : GMSMapViewDelegate{
    
    
    private func mapView(mapView: GMSMapView, didChangeCameraPosition position: GMSCameraPosition) {
        print("good yarr")
        
    }
    
    func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
        print("Tapping On Map")
        return true
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("Placing Position")
        
        placeMarkers(coordinate)
      
        
    }
    
    func placeMarkers(_ position : CLLocationCoordinate2D){
        
        let marker  = GMSMarker(position: position)
        marker.map = self.gmapView
    
    }
    
}

//GoogleCamera
extension LocationVC{
    
    func getCurrentPostion(_ coordinates : CLLocationCoordinate2D, _ zoom : Float){
        print("The Camera Corrdinates are",coordinates)
        let camera = GMSCameraPosition.camera(withLatitude: coordinates.latitude, longitude: coordinates.longitude, zoom: zoom)
        self.gmapView?.isMyLocationEnabled = true
        self.gmapView.animate(to: camera)
        
        self.locationManager.stopUpdatingLocation()
        
    }
}



