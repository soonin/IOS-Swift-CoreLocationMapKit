//
//  ViewController.swift
//  IOS-Swift-CoreLocationMapKit
//
//  Created by Pooya on 2018-09-12.
//  Copyright © 2018 Pooya. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate  {
    
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var devLatitude: UITextField!
    @IBOutlet weak var devlongitude: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("start did load")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        print("Start Did Appear")
        
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let trueData: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(trueData.latitude) \(trueData.longitude)")
        self.devLatitude!.text = "Latitude: \(trueData.latitude)"
        self.devlongitude!.text = "Longitude: \(trueData.longitude)"
    }

}

