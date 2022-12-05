//
//  restaurantViewController.swift
//  CS329E_mainProject
//
//  Created by Laynee Tourne-Morton on 11/26/22.
//

import UIKit
import MapKit
import CoreLocation

class restaurantViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize a pin
        var pin = MKPointAnnotation()
        
        // this is a test location for simulator use
        pin.coordinate = CLLocationCoordinate2D(
            latitude: 30.286494630162007,
            longitude: -97.73658237371653)
        
        // pin title displays location to the user
        pin.title = "Your Location"
        
        // add pin of test location
        mapView.addAnnotation(pin)
        
        // example restaurant 1
        var restaurant1 = MKPointAnnotation()
        restaurant1.coordinate = CLLocationCoordinate2D(latitude: 30.285946037676595, longitude: -97.74210517359552)
        restaurant1.title = "Sweet Green"
        
        mapView.addAnnotation(restaurant1)
        
        // example restaurant 2
        var restaurant2 = MKPointAnnotation()
        restaurant2.coordinate = CLLocationCoordinate2D(latitude: 30.286796263108872, longitude: -97.74119920734401)
        restaurant2.title = "Chick-fil-a"
        
        mapView.addAnnotation(restaurant2)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        addNavBarImage()
        
        // set up location manager
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    // updates user location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            manager.stopUpdatingLocation()
            
            render(location)
        }
    }
    
    // for demonstration, if user selects Show My Location, map will zoom to test location
    @IBAction func showLocationPress(_ sender: Any) {

        // test location
        let center = CLLocationCoordinate2D(latitude: 30.286494630162007, longitude: -97.73658237371653)
        
        // size of location view
        let NSdistance = 1500.0   // meters
        let EWdistance = 1500.0
        
        // create region of view for user
        let region = MKCoordinateRegion(
            center: center,
            latitudinalMeters: NSdistance,
            longitudinalMeters: EWdistance)
            
        // zoom in to region of view for user
        mapView.setRegion(region, animated: true)

    }
    
    // if actual user location, will show user location
    func render(_ location: CLLocation){
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    // logo formatting function
    func addNavBarImage() {
        
        let titleView = UIView(frame: CGRectMake(0, 0, 130, 40))
        let titleImageView = UIImageView(image: UIImage(named: "banner1"))
        titleImageView.frame = CGRectMake(0, 0, titleView.frame.width, titleView.frame.height)
        titleView.addSubview(titleImageView)
        navigationItem.titleView = titleView
    }

}
