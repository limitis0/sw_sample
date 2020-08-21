//
//  ContentView.swift
//  ExList
//
//  Created by  Ting-Wei Lee on 2020/7/30.
//

import SwiftUI

struct ContentView: View {
//    define the jump-up page
    @State var showDetailView = false
    @State var selectedIcon: Icon?
    
    struct Icon: Identifiable {
        var id = UUID()
        var name:String
        var img:String
    }
    
    var icons = [
        Icon(name: "add", img: "add"),
        Icon(name: "Icon ionic-md-add-1", img: "Icon ionic-md-add-1"),
        Icon(name: "Icon ionic-md-add-2", img: "Icon ionic-md-add-2"),
        Icon(name: "Icon ionic-md-add", img: "Icon ionic-md-add"),
        Icon(name: "Icon ionic-md-arrow-back", img: "Icon ionic-md-arrow-back"),
        Icon(name: "Icon ionic-md-bowtie-1", img: "Icon ionic-md-bowtie-1"),
        Icon(name: "Icon ionic-md-bowtie-2", img: "Icon ionic-md-bowtie-2"),
        Icon(name: "Icon ionic-md-bowtie", img: "Icon ionic-md-bowtie"),
        Icon(name: "Icon ionic-md-camera-1", img: "Icon ionic-md-camera-1"),
        Icon(name: "Icon ionic-md-camera-2", img: "Icon ionic-md-camera-2"),
        Icon(name: "Icon ionic-md-camera", img: "Icon ionic-md-camera"),
        Icon(name: "Icon ionic-md-checkmark-circle-outline-1", img: "Icon ionic-md-checkmark-circle-outline-1"),
        Icon(name: "Icon ionic-md-checkmark-circle-outline-2", img: "Icon ionic-md-checkmark-circle-outline-2"),
        Icon(name: "Icon ionic-md-close-circle-outline", img: "Icon ionic-md-close-circle-outline"),
        Icon(name: "Icon ionic-md-clipboard-1", img: "Icon ionic-md-clipboard-1"),
        Icon(name: "Icon ionic-md-clipboard-2", img: "Icon ionic-md-clipboard-2"),
        Icon(name: "Icon ionic-md-clipboard", img: "Icon ionic-md-clipboard")
    ]
    
    struct BasicImageRow: View {
        var thisIcon: Icon
        var body: some View {
            HStack{
                Image(thisIcon.img)
                Text(thisIcon.name)
            }
        }
    }
    
    var body: some View {
//        List(icons){ thisIcon in
//            HStack{
//                Image(thisIcon.img)
//                Text(thisIcon.name)
//            }
////            1. traditional method
//            Text("add_round")
//            Text("add_blue")
//            Text("add_black")
//            Text("add_gray")
////            2. use for-each to add var iconNames
//            ForEach(1...4, id:\.self){index in Text("Item \(index)")}
//        }

        NavigationView{
////            add a navigation view(jump through navigation link)
//            List(icons){ iconItem in
//                NavigationLink(destination:
//                                IconDetailView(icon: iconItem)){
//                    BasicImageRow(thisIcon: iconItem)
//                }
//            }
            List(icons){iconItem in
                BasicImageRow(thisIcon: iconItem)
                    .onTapGesture{
                        self.showDetailView = true
                        self.selectedIcon = iconItem
                    }
            }
            .sheet(item:self.$selectedIcon){thisIcon in
                IconDetailView(icon: thisIcon)
            }
            .navigationBarTitle("ICON")
        }
    }
    
    struct IconDetailView: View {
        @Environment(\.presentationMode) var presentationMode
        var icon:Icon
        var body: some View {
            ScrollView{
                VStack{
                    Image(icon.img)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipped()
                        .frame(width: 300, height: 300, alignment: .bottom)
                        .background(Color.init(red: 140/255, green: 168/255, blue: 176/255))
                    Text(icon.name)
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.black)
                    Spacer()
                }
            }
            .overlay(
                HStack{
                    Spacer()
                    VStack{
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }, label:{
                            Image(systemName:"chevron.down.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(.gray)
                        })
                        .padding(.trailing, 20)//leading, trailing, bottom, top
                        .padding(.top, 40)
                        Spacer()
                    }
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
