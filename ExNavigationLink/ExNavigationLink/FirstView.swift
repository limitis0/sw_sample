//
//  FirstView.swift
//  ExNavigationLink
//
//  Created by Ting-Wei Lee on 2020/10/29.
//

import SwiftUI

struct FirstView: View {
    //navigate with btn
    @State private var isShowSecondView = false
    var body: some View {
        NavigationView{
            /// - navigate with text & image
//            NavigationLink(
//                destination: SecondView(),
//                label: {
//                    VStack{
//                        ///Link With Text
//                        Text("Go to second view")
//                            .foregroundColor(.gray)
//                        ///Link With Image
//                        Image(systemName: "circle.fill")
//                            .resizable()
//                            .frame(width: 100, height: 100, alignment: .center)
//                            .foregroundColor(.red)
//                    }
//                })
//                .navigationBarTitle(Text("The First View"))
            /// - navigate with btn
            NavigationLink(
                destination: SecondView(),
                isActive: $isShowSecondView
            ) {
                EmptyView()
            }
            Button(
                action: {
                    self.isShowSecondView = true
                },
                label: {
                    VStack{
                        Image("bat")
                        Text("Press the bat which will bring you to the second page")
                    }
                }
            )
            .navigationBarTitle(Text("The First View"))
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
