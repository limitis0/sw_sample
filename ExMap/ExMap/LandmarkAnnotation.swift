//
//  LandmarkAnnotation.swift
//  ExMap
//
//  Created by  Ting-Wei Lee on 2020/8/13.
//

import UIKit
import MapKit

class LandmarkAnnotation: NSObject, MKAnnotation {
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String?,
         subtitle: String?,
         coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
    
    static func requestMockData()-> [LandmarkAnnotation]{
        return [
            LandmarkAnnotation(title: "中央大學",
                               subtitle: "正門",
                               coordinate: .init(
                                latitude: 24.968299,
                                longitude: 121.195464)),
            LandmarkAnnotation(title: "中央大學",
                               subtitle: "後門",
                               coordinate: .init(
                                latitude: 24.965946,
                                longitude: 121.191130))
        ]
    }

}
