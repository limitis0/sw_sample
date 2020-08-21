//
//  DisplayOrderType.swift
//  ExSelectedCardTab
//
//  Created by  Ting-Wei Lee on 2020/8/20.
//

import Foundation
////??
//struct Book: Identifiable {
//    var id = UUID()
//    var name:String
//    var img:String
//    var description: String
//    var isFeature: Bool
//    var price: Int
//}

enum DisplayOrderType: Int, CaseIterable {
    case featureFirst = 0
    case alphabetical = 1
    case showPriceFirst = 2
    
    init(type: Int) {
        switch type {
        case 0: self = .featureFirst
        case 1: self = .alphabetical
        case 2: self = .showPriceFirst
            
        default: self = .featureFirst
        }
    }
    
    var text: String {
        switch self {
        case .featureFirst:
            return "Feature First"
        case .alphabetical:
            return "Alphabetical"
        case .showPriceFirst:
            return "Show Price First"
        }
    }
    
    func predicate()->((IndexView.Book, IndexView.Book) -> Bool) {
        switch self {
        case .alphabetical:
            return {$0.name < $1.name}
        case .featureFirst:
            return {$0.isFeature && !$1.isFeature}
        case .showPriceFirst:
            return {$0.price < $1.price}
        }
    }
    
}
