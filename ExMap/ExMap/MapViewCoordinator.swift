//
//  MapViewCoordinator.swift
//  ExMap
//
//  Created by  Ting-Wei Lee on 2020/8/13.
//

import UIKit
import MapKit

class MapViewCoordinator: NSObject, MKMapViewDelegate {
    var mapViewController: MapView
    
    init(_ control: MapView) {
        self.mapViewController = control
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        custom view for annotation
        let annotationView = MKAnnotationView(annotation: annotation,
                                              reuseIdentifier: "customView")
        annotationView.canShowCallout = true
//        customized icon
        annotationView.image = UIImage(systemName: "hand.point.down.fill")
        return annotationView
    }
    
}
