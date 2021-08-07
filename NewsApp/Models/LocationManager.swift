//
//  LocationManager.swift
//  NewsApp
//
//  Created by Raghav Sharma on 07/08/21.
//

import Foundation
import CoreLocation
import Combine

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate{
    private let locationManager = CLLocationManager()
    @Published var locationStatus: CLAuthorizationStatus?
    @Published var lastLocation: CLLocation?
    
    override init(){
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    var statusString: String{
        guard let status = locationStatus else{
            return "unkown"
        }
        
        switch status{
        case .notDetermined: return "unkown"
        case .authorizedWhenInUse: return "done"
        default: return "unkown"
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        locationStatus = status
        print(#function, statusString)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        lastLocation = location
        print(#function, location)
    }
    
    func fetchCountry(lat: Double, long: Double){
        let urlString = "https://geocode.xyz/\(lat),\(long)?geoit=json"
        if let url = URL(string: urlString){
        }
    }
}
    
