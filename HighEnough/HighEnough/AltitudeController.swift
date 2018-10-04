//
//  AltitudeController.swift
//  HighEnough
//
//  Created by Jason Sanchez on 10/4/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//

import UIKit
import CoreLocation

class AltitudeController: UIViewController {
    
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationServices()
        } else {
            // Show alert letting user know they have to turn this on.
        }
    }

    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            break
        case .denied:
            // Show alert instructing them how to turn on permissions
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            // show an alert letting them know what's up
            break
        case .authorizedAlways:
            break
        }
    }
    
//    func setBackground() {
//        backgroundImageView             = UIImageView(frame: CGRect.zero)
//        backgroundImageView.image       =
//        backgroundImageView.contentMode = .scaleAspectFill
//        view.addSubview(backgroundImageView)
//        view.sendSubviewToBack(backgroundImageView)
//
//        backgroundImageView.translatesAutoresizingMaskIntoContraints                         = false
//        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive           = true
//        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive   = true
//        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive     = true
//        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//    }
}

extension AltitudeController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let altitude = location.altitude.rounded(toDecimalPlaces: 0)
        gpsAltitudeLabel.text = "\(Int(altitude))"
        altitudeMarginOfErrorLabel.text = "+/-      \(location.verticalAccuracy)m"
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
}
