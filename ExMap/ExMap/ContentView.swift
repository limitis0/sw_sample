//
//  ContentView.swift
//  ExMap
//
//  Created by  Ting-Wei Lee on 2020/8/11.
//

import SwiftUI
import MapKit

struct Restaurant {
    var name: String
    var description: String
    var location: CLLocationCoordinate2D
}

var thisRestaurant = Restaurant(
    name: "無敵蛋餅（原好兇）",
    description: "No. 347, Wu-Shing Rd.,\nZong-Li Dist.,\nTaoyuan City 320 \n+886928111111",
    location: CLLocationCoordinate2D(
        latitude: 24.9655141,
        longitude: 121.1924017))


struct ContentView: View {
    @State var currentRestaurant: Restaurant = thisRestaurant
//    setting map and buttom title
    var body: some View {
        VStack{
            MapView(currentRestaurant: $currentRestaurant)
            Text("current location")
//            Text("\(thisRestaurant.name)")
                .frame(height: 50, alignment: .center)
                .font(.title)
        }
        .padding(.all, 10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
