//
//  CardView.swift
//  ExStorage
//
//  Created by  Ting-Wei Lee on 2020/8/6.
//

import SwiftUI

struct TermAndDescription: Identifiable {
    var id = UUID()
    var term: String
    var description: String
}

var myDict = [
    TermAndDescription(term: "book 01", description: "111"),
    TermAndDescription(term: "book 02", description: "222"),
    TermAndDescription(term: "book 03", description: "333"),
    TermAndDescription(term: "book 04", description: "444"),
    TermAndDescription(term: "book 05", description: "555"),
    TermAndDescription(term: "book 06", description: "666"),
    TermAndDescription(term: "book 07", description: "777")
]


struct CardView: View {
    @State var currentCard = 0
    
    var body: some View {
        VStack{
            VStack{
                Text(myDict[currentCard].term)
                    .font(.title)
                    .padding(.all, 10)
                Text(myDict[currentCard].description)
                    .font(.body)
                    .foregroundColor(Color(red: 108/255, green: 112/255, blue: 100/255))
                    .padding(.all, 10)
            }
            .frame(minWidth: 0, idealWidth: 100, maxWidth: 300,
                    minHeight: 0, idealHeight: 100, maxHeight: 300,
                    alignment: .center)
            .background(Color(red: 189/255, green: 203/255, blue: 164/255, opacity: 80.0))
            .onTapGesture{
                if currentCard<myDict.count-1{
                    currentCard+=1
                }else{
                    currentCard=0
                }
            }
            Text("cilck to view next card")
                .padding(.all, 10)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
