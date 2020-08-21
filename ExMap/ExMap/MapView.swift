//
//  MapView.swift
//  ExMap
//
//  Created by  Ting-Wei Lee on 2020/8/11.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @Binding var currentRestaurant: Restaurant
    let mapView = MKMapView(frame: .zero)
    var locationManager = CLLocationManager() //not necessary in map view but remember to import MapKit
        
    let landmarks = LandmarkAnnotation.requestMockData()
    
    func setupManager() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
    }
    
    
    func makeUIView(context: Context) -> MKMapView {
//        MKMapView(frame: .zero)
        setupManager()
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        return mapView
    }

    func updateUIView(_ view: MKMapView, context: Context) {
//        for user's current location
        let coordinate = mapView.userLocation.coordinate
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
        //customeize icon of current location
        view.delegate = context.coordinator
        //turn lo, la into address
        let currentLocation = CLLocationCoordinate2D(
            latitude: locationManager.location?.coordinate.latitude ?? 0.00,
            longitude: locationManager.location?.coordinate.longitude ?? 0.00)
        CLGeocoder().reverseGeocodeLocation(
            CLLocation(
                latitude: currentLocation.latitude,
                longitude: currentLocation.longitude),
            completionHandler: {(places, error) in
                if error == nil{
                    mapView.userLocation.subtitle = places?[0].description ?? "empty ass"
                }else{
                    mapView.userLocation.subtitle = "no address found"
                }
            })
        //set title
        mapView.userLocation.title =
            "\(String(format: "%.10f", currentLocation.latitude)), \(String(format: "%.10f", currentLocation.longitude))"
 /*
        //get la and lo, get la and lo, set title
        mapView.userLocation.title = "current location"
        mapView.userLocation.subtitle =
            "\(locationManager.location?.coordinate.latitude ?? 0.00), \(locationManager.location?.coordinate.longitude ?? 0.00)"
                      */
//////    set a initialise location: CLLocationCoordinate2D(latitude, longitude)
////        let coordinate = CLLocationCoordinate2D(
////            latitude: 24.967773, longitude: 121.191585)
//        let coordinate = currentRestaurant.location
////        map shown size(area?
//        let span = MKCoordinateSpan(
//            latitudeDelta: 0.005, longitudeDelta: 0.005)
//        let region = MKCoordinateRegion(
//            center: coordinate, span: span)
////        use animation to move to set current location
//        view.setRegion(region, animated: true)
////        add customized icon from class "LandmarkAnnotation"
//        view.delegate = context.coordinator
////        add landmarks from class"LandmarkAnnotation"
//        view.addAnnotations(landmarks)
////        setting specific landmark name & detail
//        let landmark = LandmarkAnnotation(
//            title: currentRestaurant.name,
//            subtitle: currentRestaurant.description,
//            coordinate: currentRestaurant.location)
//        view.addAnnotation(landmark)
//        view.selectAnnotation(landmark, animated: true)        
    }
//    if no: Cannot assign value of type 'Void' to type 'MKMapViewDelegate?'
    func makeCoordinator() -> MapViewCoordinator {
        MapViewCoordinator(self)
    }
}

//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
//}
