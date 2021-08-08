//
//  LocationManager.swift
//  NewsApp
//
//  Created by Raghav Sharma on 07/08/21.
//

import Foundation
import MapKit

struct CountryCode: Decodable{
    let country: String
}

class CountryGiver{
    
}
class LocationManager: NSObject, ObservableObject{
    private let locationManager = CLLocationManager()
    @Published var country: String? = nil
    
    override init(){
        super.init()
        self.locationManager.delegate  = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    func fetchCountryCode(lat: Float, long: Float){
        let urlString: String = "https://raghavtinker.servatom.com/country?lat=\(lat)&long=\(long)"
        if let url = URL(string: urlString){
            // If the url is valid
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){ (data, response, error) in
                if error == nil{
                    //No error
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do{
                            let results = try decoder.decode(CountryCode.self, from: safeData)
                            DispatchQueue.main.async {
                                self.country = results.country
                                self.locationManager.stopUpdatingLocation()
                                print(results.country)
                            }
                        }
                        catch{
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}

extension LocationManager: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else{
            return
        }
        self.fetchCountryCode(lat: Float(location.coordinate.latitude), long: Float(location.coordinate.longitude))
        
    }
}
