//
//  ViewController.swift
//  Localizacion
//
//  Created by Henry AT on 8/26/15.
//  Copyright (c) 2015 Apps4s. All rights reserved.
//

import UIKit

import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate  {

  let locationManager = CLLocationManager()  // Add this statement
  
  @IBOutlet weak var mapView: MKMapView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    locationManager.delegate = self;
    // 2
    locationManager.requestAlwaysAuthorization()
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  
  // =  ==  = = 
  func locationManager(_ manager: CLLocationManager!, didChangeAuthorization status:CLAuthorizationStatus){
    mapView.showsUserLocation = (status == .authorizedAlways)
    
  }
  
  func locationManager(_ manager: CLLocationManager!, monitoringDidFailFor region: CLRegion!, withError error: Error) {
    println("Monitoring failed for region with identifier: \(region.identifier)")
  }
  
  func locationManager(_ manager: CLLocationManager!, didFailWithError error: Error) {
    println("Location Manager failed with the following error: \(error)")
  }
  
  
}

