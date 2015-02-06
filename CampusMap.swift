//
//  CampusMap.swift
//  AU App
//
//  Created by Dele Amon on 12/11/14.
//  Copyright (c) 2014 Dele Amon. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class CampusMap: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate {
    
    @IBOutlet weak var CampusMapView: MKMapView!
    
    /*override func viewDidLoad() {
        super.viewDidLoad()
        
        //AMERICAN UNIVERSITY LAT/LONG
        var latitude:CLLocationDegrees = 38.9368445263
        var longitude:CLLocationDegrees = -77.088694
        
        //MGC
        var MGCLat: CLLocationDegrees = 38.936833
        var MGCLong: CLLocationDegrees = -77.088694
        
        var MGC:CLLocationCoordinate2D = CLLocationCoordinate2DMake(MGCLat, MGCLong)
        
        //KOGOD
        var KogodLat:CLLocationDegrees = 38.937864
        var KogodLong:CLLocationDegrees = -77.0878
        
        var Kogod:CLLocationCoordinate2D = CLLocationCoordinate2DMake(KogodLat, KogodLong)
        
        
        
        //ZOOM CONSTRAINTS
        var latdelta:CLLocationDegrees = 0.001
        var longdelta:CLLocationDegrees = 0.001
        
        //Displays how close the view might be
        var zoomSpan:MKCoordinateSpan = MKCoordinateSpanMake(latdelta, longdelta)
        
        //TELLS MAP WHERE CENTER OF SCHOOL IS LOCATED
        var schoolLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        //TURNS zoomSpan & schoolLocation into one big coordinate
        
        var schoolRegion:MKCoordinateRegion = MKCoordinateRegionMake(schoolLocation, zoomSpan)
        
        //DISPLAYS MAP
        self.CampusMapView.setRegion(schoolRegion, animated: true)
        
        //CREATES DROPPIN ANNOTATIONs
        var MGCLocation = MKPointAnnotation()
        MGCLocation.coordinate = MGC
        
        MGCLocation.title = "Mary Graydon Center"
        MGCLocation.subtitle = "food, Main HelpDesk, and Bookstore here."
        
        
        
        var KogodLocation = MKPointAnnotation()
        MGCLocation.coordinate = Kogod
        KogodLocation.title = "Kogod"
        KogodLocation.subtitle = "School of Business"
        
        var CampusLocations:[MKPointAnnotation]=[MKPointAnnotation]()
        
        CampusLocations.append(MGCLocation)
        CampusLocations.append(KogodLocation)
        
        
        self.CampusMapView.addAnnotations(CampusLocations)
        
    }*/
    
    var WYA:CLLocationManager!
    
    var schoolAnnotation = MKPointAnnotation()
    var annotationArray = [MKPointAnnotation]()
    
    var allPinsArray: [(pinLat: CLLocationDegrees, pinLong: CLLocationDegrees, pinName: String, pinDesc: String, pinCat: Int)] =
    [(pinLat: 38.936833, pinLong: -77.088694, pinName: "Mary Graydon Center", pinDesc: "food, Main HelpDesk, and Bookstore here.", pinCat: 1),(pinLat: 38.937239, pinLong: -77.08832, pinName: "Battelle-Tompkins", pinDesc: "your counselors are here.", pinCat: 1),(pinLat: 38.937864, pinLong: -77.0878, pinName: "Kogod", pinDesc: "School of Buisiness.", pinCat: 1),(pinLat: 38.937907, pinLong: -77.087309, pinName: "Kay Spiritual Center", pinDesc: "Services of many beliefs happen here.", pinCat: 1),(pinLat: 38.937567, pinLong: -77.087155, pinName: "Ward", pinDesc: "School of Public Affairs.", pinCat: 1),(pinLat: 38.936949, pinLong: -77.087608, pinName: "Hurst", pinDesc: "Science classes typically here.", pinCat: 1),(pinLat: 38.936383, pinLong: -77.088099, pinName: "East Quad Building", pinDesc: "better known as EQB", pinCat: 1),(pinLat: 38.935971, pinLong: -77.088305, pinName: "SIS Building", pinDesc: "School of International Studies", pinCat: 1),(pinLat: 38.936218, pinLong: -77.088746, pinName: "Bender Library", pinDesc: "The Schools Main Library", pinCat: 1),(pinLat: 38.936049, pinLong: -77.089416, pinName: "McKinley Building", pinDesc: "recently reconstructed", pinCat: 1),(pinLat: 38.937676, pinLong: -77.089695, pinName: "Bender Arena", pinDesc: "Sports Center", pinCat: 1),(pinLat: 38.937723, pinLong: -77.090516, pinName: "SCAN", pinDesc: "Sports Center Annex; CompSci and Physics are here", pinCat: 1),(pinLat: 38.937026, pinLong: -77.090109, pinName: "Asbury", pinDesc: "AUCentral(FinAid office) is here", pinCat: 1),(pinLat: 38.938334, pinLong: -77.089334, pinName: "Ampitheatre", pinDesc: "Performances of sorts occur here", pinCat: 1),(pinLat: 38.939724, pinLong: -77.089928, pinName: "Wesley Theological Seminary", pinDesc: "School of Theology", pinCat: 1),(pinLat: 38.939185, pinLong: -77.087065, pinName: "Katzen Art Center", pinDesc: "C. of Arts&Sciences and Admin office here", pinCat: 1),(pinLat: 38.937451, pinLong: -77.090971, pinName: "Osborn", pinDesc: "Don't go here", pinCat: 1),(pinLat: 38.936776, pinLong: -77.091413, pinName: "Beeghly", pinDesc: "Chemistry Building", pinCat: 1),(pinLat: 38.936393, pinLong: -77.091682, pinName: "Media Production Center", pinDesc: "AU TV productions happen here", pinCat: 1),(pinLat: 38.935664, pinLong: -77.091858, pinName: "Child Development Center", pinDesc: "Both Students and Children develop here", pinCat: 1),(pinLat: 38.939110, pinLong: -77.085690, pinName: "Nebraska Hall", pinDesc: "Notable Upperclassmen Dorm", pinCat: 1),(pinLat: 38.939074, pinLong: -77.088415, pinName: "President's Building", pinDesc: "The President doesn't stay here", pinCat: 1),(pinLat: 38.939065, pinLong: -77.088974, pinName: "Cassell Hall", pinDesc: "Newest Dorm on Campus", pinCat: 1),(pinLat: 38.938273, pinLong: -77.088434, pinName: "Hughes Hall", pinDesc: "Dorm", pinCat: 1),(pinLat: 38.938754, pinLong: -77.088813, pinName: "McDowell Hall", pinDesc: "Dorm", pinCat: 1),(pinLat: 38.938724, pinLong: -77.089431, pinName: "Leonard Hall", pinDesc: "Dorm", pinCat: 1),(pinLat: 38.935506, pinLong: -77.089416, pinName: "Clark Hall", pinDesc: "Dorm", pinCat: 1),(pinLat: 38.935260, pinLong: -77.088998, pinName: "Roper Hall", pinDesc: "Dorm", pinCat: 1),(pinLat: 38.935160, pinLong: -77.089860, pinName: "McCabe Hall", pinDesc: "Health Center is Here", pinCat: 1),(pinLat: 38.934905, pinLong: -77.089385, pinName: "Gray Hall", pinDesc: "Math Department is Here", pinCat: 1),(pinLat: 38.935607, pinLong: -77.090310, pinName: "Letts Hall", pinDesc: "Notable Freshman Dorm 'Southside'& HDP Office is here", pinCat: 1),(pinLat: 38.935907, pinLong: -77.090836, pinName: "Anderson-Centennial", pinDesc: "Notable Freshman Dorm 'Southside'", pinCat: 1),(pinLat: 38.934890, pinLong: -77.090643, pinName: "Rockwood Hall", pinDesc: "not sure what it is", pinCat: 1),(pinLat: 38.934799, pinLong: -77.091000, pinName: "Public Saftey", pinDesc: "HeadQuarters of the Few and the Proud", pinCat: 1),(pinLat: 38.935007, pinLong: -77.091275, pinName: "Jack Child Hall", pinDesc: "no children are here", pinCat: 1),(pinLat: 38.935022, pinLong: -77.091728, pinName: "Hamilton Hall", pinDesc: "can't really go in there", pinCat: 1),(pinLat: 38.934778, pinLong: -77.092583, pinName: "Kreeger Building", pinDesc: "Psychology Dept. & ATECH Studios", pinCat: 1),(pinLat: 38.935227, pinLong: -77.092823, pinName: "Watkins Building", pinDesc: "stuff is there ", pinCat: 1),(pinLat: 38.937500, pinLong: -77.091759, pinName: "Reeves Field", pinDesc: "you can soccer here", pinCat: 1),(pinLat: 38.935955, pinLong: -77.093033, pinName: "W.I. Jacobs Recreational Complex", pinDesc: "you can play baseball", pinCat: 1)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var AUlatcenter = 38.9368445263
        var AUlongcenter =  -77.088694
        
        var latDelta = 0.001
        var longDelta = 0.001
        
        var AUZoomSpan: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        var AULocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(AUlatcenter, AUlongcenter)
        var AURegion: MKCoordinateRegion = MKCoordinateRegionMake(AULocation, AUZoomSpan)
        self.CampusMapView.setRegion(AURegion, animated: true)
        
        for onePin in allPinsArray {
            let schoolAnnotation = MKPointAnnotation()
            
            
            var onePinLoc: CLLocationCoordinate2D = CLLocationCoordinate2DMake(onePin.pinLat, onePin.pinLong)
                        schoolAnnotation.coordinate = onePinLoc
            
            schoolAnnotation.title = onePin.pinName
            
            
            schoolAnnotation.subtitle = onePin.pinDesc
            
            annotationArray.append(schoolAnnotation)
        }
        
        self.CampusMapView.addAnnotations(annotationArray)
        
        WYA = CLLocationManager()
        WYA.delegate = self
        WYA.desiredAccuracy = kCLLocationAccuracyBest
        WYA.requestAlwaysAuthorization()
        WYA.startUpdatingLocation()
        self.CampusMapView.showsUserLocation = true
        self.CampusMapView.delegate = self

    
    /*override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }*/

}
}
