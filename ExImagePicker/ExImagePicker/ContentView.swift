//
//  ContentView.swift
//  ExImagePicker
//
//  Created by  Ting-Wei Lee on 2020/8/11.
//

import SwiftUI

struct ContentView: View {
    @State var isShowPicker: Bool = false
    @State var image: Image? = Image("placeholder")
    @State var isSourceTypeAlbum: Bool = true
    var body: some View {
        VStack{
            Text("Import pictures")
                .font(.title)
            image?
                .resizable()
                .scaledToFit()
                .frame(height: 320)
            HStack{
                Button(action:{
                    withAnimation{
                        self.isShowPicker.toggle()
                        self.isSourceTypeAlbum = true
                    }
                }) {
                    Image(systemName: "photo")
                    Text("open albumn")
                        .font(.headline)
                }
                Spacer()
                Button(action:{
                    withAnimation{
                        self.isShowPicker.toggle()
                        self.isSourceTypeAlbum = false
                    }
                }) {
                    Image(systemName: "camera")
                    Text("turn on camera")
                        .font(.headline)
                }
            }.padding(.horizontal, 50)
            Spacer()
        }
        .sheet(isPresented: $isShowPicker){
            ImagePicker(
                image: self.$image,
                isSourceTypeAlbum: self.$isSourceTypeAlbum)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
