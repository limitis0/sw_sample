//
//  IndexView.swift
//  ExPages
//
//  Created by  Ting-Wei Lee on 2020/8/4.
//

import SwiftUI

struct IndexView: View {
    @State var showDetailView = false
    @State var selectedBook: Book?
    
    struct Book: Identifiable {
        var id = UUID()
        var name:String
        var img:String
        var description: String
    }
    
    var books = [
        Book(name: "book 01", img: "img_01", description: "111"),
        Book(name: "book 02", img: "img_02", description: "222"),
        Book(name: "book 03", img: "img_03", description: "333"),
        Book(name: "book 04", img: "img_04", description: "444"),
        Book(name: "book 05", img: "img_05", description: "555"),
        Book(name: "book 06", img: "img_06", description: "666"),
        Book(name: "book 07", img: "img_07", description: "777")
    ]
    
    struct BasicImageRow: View {
        var thisBook: Book
        var body: some View {
            HStack{
                Image(thisBook.img)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                    .frame(width: 80, height: 80, alignment: .leading)
                Text(thisBook.name)
                    .foregroundColor(Color(red: 108/255, green: 112/255, blue: 100/255))
            }
        }
    }
    
    var body: some View {
        NavigationView{
            List(books){bookItem in
                BasicImageRow(thisBook: bookItem)
                    .onTapGesture{
                        self.showDetailView = true
                        self.selectedBook = bookItem
                    }
            }
            .sheet(item:self.$selectedBook){thisBook in
                BookDetailView(book: thisBook)
            }
            .navigationBarTitle("BOOK")
        }
    }
    
    struct BookDetailView: View {
        @Environment(\.presentationMode) var presentationMode
        var book:Book
        var body: some View {
            ScrollView{
                VStack{
                    Image(book.img)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipped()
                        .frame(width: 300, height: 300, alignment: .bottom)
                        .background(Color(red: 154/255, green: 175/255, blue: 115/255))
                    Text(book.name)
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.black)
                        .foregroundColor(Color(red: 108/255, green: 112/255, blue: 100/255))
                    Text(book.description)
                        .fontWeight(.light)
                        .foregroundColor(.gray)
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
                                .foregroundColor(Color(red: 189/255, green: 203/255, blue: 164/255))
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

struct IndexView_Previews: PreviewProvider {
    static var previews: some View {
        IndexView()
    }
}
