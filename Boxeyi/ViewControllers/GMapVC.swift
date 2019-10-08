//
//  GMapVC.swift
//  Boxeyi
//
//  Created by talha on 03/10/2019.
//  Copyright © 2019 Boxeyi. All rights reserved.
//

import UIKit
import MapKit
import GoogleMaps
import GooglePlaces
import CoreLocation

class GMapVC: UIViewController {

    //MapView
    @IBOutlet weak var gMap: GMSMapView!
    
    //Buttons
    @IBOutlet weak var dismissBtnOutlet: UIButton!
    @IBOutlet weak var searchBtnOutlet: UIButton!
    
    //Location Manager
    var locationManager = CLLocationManager()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()

        self.gMap.delegate = self
        
        self.setUpLocationManagerDelegate()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.dismissBtnOutlet.getRoundedcorner(cornerRadius: self.dismissBtnOutlet.roundWidth())
         self.searchBtnOutlet.getRoundedcorner(cornerRadius: self.searchBtnOutlet.roundWidth())
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
}

//Btn Action

extension GMapVC{
    
    @IBAction func dismissAction(_ sender: Any) {
          self.view.endEditing(true)
          self.dismiss(animated: true, completion: nil)
      }
      
      @IBAction func serchPlaceAction(_ sender: Any) {
      }
}

//Location Manager
extension GMapVC : CLLocationManagerDelegate {
    
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
            self.getCurrentPostion(coordinates, 50)
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
extension GMapVC : GMSMapViewDelegate{
    
    
    private func mapView(mapView: GMSMapView, didChangeCameraPosition position: GMSCameraPosition) {
        print("good yarr")
        
    }
    
    func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
        print("Tapping On Map")
        return true
    }
        
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("Placing Position")
        print(mapView.myLocation)
        
    }

}

//GoogleCamera
extension GMapVC{
    
    func getCurrentPostion(_ coordinates : CLLocationCoordinate2D, _ zoom : Float){
        print("The Camera Corrdinates are",coordinates)
        let camera = GMSCameraPosition.camera(withLatitude: coordinates.latitude, longitude: coordinates.longitude, zoom: zoom)
        self.gMap?.isMyLocationEnabled = true
        self.gMap.animate(to: camera)
        
        self.locationManager.stopUpdatingLocation()
        
    }
}



