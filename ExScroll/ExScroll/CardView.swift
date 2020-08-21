//
//  CardView.swift
//  ExScroll
//
//  Created by  Ting-Wei Lee on 2020/8/4.
//

import SwiftUI

struct CardView: View {
    var image: String
    var nameUs: String
    var nameTw: String
    var subName: String
    
    var body: some View {
        VStack{
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)//let pic have same size as card
                .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity,
                       minHeight: 0, idealHeight: 100, maxHeight: .infinity,
                       alignment: .center)
            VStack(alignment: .leading){
                Text(nameUs)
                    .font(.headline)
                    .foregroundColor(.secondary)
                Text(nameTw)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .lineLimit(3)
                Text(subName)
                    .font(.caption)
                    .foregroundColor(Color(red: 115/255, green: 154/255, blue: 175/255))
            }
            .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity,
                   alignment: .leading)
            .padding(.horizontal,10)
            .padding(.bottom,10)
        }
        .background(Color(red: 235/255, green: 224/255, blue: 193/255))
        .cornerRadius(15)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                    .stroke(Color(red: 115/255, green: 154/255, blue: 175/255),
                            lineWidth: 2)
        )
        .padding(.all,10)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View{
        
//        vertical scrolling
//        ScrollView{
//            VStack{
//                Text("Books")
//                    .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity,
//                           alignment: .leading)
//                    .padding(.all, 10)
//                Text("書")
//                    .font(.title).frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity,
//                                        alignment: .leading)
//                    .padding(.leading, 10)
//                CardView(image: "img_01", nameUs: "Book 1", nameTw: "書一", subName: "b1")
//                CardView(image: "img_02", nameUs: "Book 2", nameTw: "書二", subName: "b2")
//                CardView(image: "img_03", nameUs: "Book 3", nameTw: "書三", subName: "b3")
//                CardView(image: "img_04", nameUs: "Book 4", nameTw: "書四", subName: "b4")
//                CardView(image: "img_05", nameUs: "Book 5", nameTw: "書五", subName: "b5")
//            }
//        }
        
//        horizontal scrolling
        VStack{
            Text("Books")
                .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity,
                       alignment: .leading)
                .padding(.all, 10)
            Text("書")
                .font(.title).frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity,
                                    alignment: .leading)
                .padding(.leading, 10)
            ScrollView(.horizontal){
                HStack{
                    
                    CardView(image: "img_01", nameUs: "Book 1", nameTw: "書一", subName: "b1")
                        .frame(width: 320, height: 400, alignment: .center)
                    CardView(image: "img_02", nameUs: "Book 2", nameTw: "書二", subName: "b2")
                        .frame(width: 320, height: 400, alignment: .center)
                    CardView(image: "img_03", nameUs: "Book 3", nameTw: "書三", subName: "b3")
                        .frame(width: 320, height: 400, alignment: .center)
                    CardView(image: "img_04", nameUs: "Book 4", nameTw: "書四", subName: "b4")
                        .frame(width: 320, height: 400, alignment: .center)
                    CardView(image: "img_05", nameUs: "Book 5", nameTw: "書五", subName: "b5")
                        .frame(width: 320, height: 400, alignment: .center)
                }
            }
        }
    }
}
