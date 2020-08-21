//
//  IndexView.swift
//  ExStorage
//
//  Created by  Ting-Wei Lee on 2020/8/6.
//

import SwiftUI

struct IndexView: View {
    @State var showDetailView = false
    @State var selectedBook: Book?
//    show feature
    @AppStorage("showFeatureOnly") var showFeatureOnly = false
    @AppStorage("showPriceLowerThanOnly") var showPriceLowerThanOnly: Int = 10
//    sorted
    @AppStorage("displayOrder") var displayOrder = DisplayOrderType.featureFirst
//    left swipe delete
    @State var books = [
        Book(name: "book 01", img: "img_01", description: "111", isFeature: true, price: 10),
        Book(name: "book 02", img: "img_02", description: "222", isFeature: false, price: 13),
        Book(name: "book 03", img: "img_03", description: "333", isFeature: false, price: 8),
        Book(name: "book 04", img: "img_04", description: "444", isFeature: false, price: 30),
        Book(name: "book 05", img: "img_05", description: "555", isFeature: true, price: 12),
        Book(name: "book 06", img: "img_06", description: "666", isFeature: false, price: 20),
        Book(name: "book 07", img: "img_07", description: "777", isFeature: true, price: 3)
    ]
    
    
    struct Book: Identifiable {
        var id = UUID()
        var name:String
        var img:String
        var description: String
        var isFeature: Bool
        var price: Int
        var isFavrite: Bool = false
    }
    
    
    
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
                if thisBook.isFavrite{ //set for long-click menu
                    Spacer()
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        
                }
            }
        }
    }
    
    struct FullImageRow: View {
        var thisBook: Book
        var body: some View{
            ZStack{
                Image(thisBook.img)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .frame(height: 180)
                    .overlay(
                        Rectangle()
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .opacity(0.2)
                    )
                Text(thisBook.name)
                    .font(.system(.title))
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .offset(x: 0.0, y: 50.0)
                if thisBook.isFavrite{ //set for long-click menu
                    Spacer()
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .offset(x: 150.0, y: -70.0)
                        .font(.largeTitle)
                }
            }
        }
    }
    
//    set up selection
    func shouldShowItem(books: Book) -> Bool {
        return (showFeatureOnly ? books.isFeature: true) && (books.price <= showPriceLowerThanOnly)
    }
//    set func of long-click interation
    private func delete(item book: Book){
        if let index = self.books.firstIndex(where: {
            $0.id == book.id
        }){
            books.remove(at: index)
        }
    }
    private func setFavorite(item book: Book){
        if let index = self.books.firstIndex(where: {
            $0.id == book.id
        }){
            books[index].isFavrite.toggle()
        }
    }
    
//set up selection
    var body: some View {
        NavigationView{
            List{
//                to prevent empty space, wrap content with for-each
                ForEach(books.sorted(by: displayOrder.predicate())){
                    bookItem in
                    if self.shouldShowItem(books: bookItem){
                        if bookItem.isFeature{
                            FullImageRow(thisBook: bookItem)
                                .onTapGesture{
                                    self.showDetailView = true
                                    self.selectedBook = bookItem
                                }
                                .contextMenu{ //add long-click menu
                                    Button(action: {
                                        self.delete(item: bookItem)
                                    }){
                                        HStack{
                                            Text("Delete the book")
                                            Image(systemName: "trash")
                                        }
                                    }
                                    Button(action: {
                                        self.setFavorite(item: bookItem)
                                    }){
                                        HStack{
                                            Text("Add/delete my fravorite")
                                            Image(systemName: "star")
                                        }
                                    }
                                }
                            
                        }else{
                            BasicImageRow(thisBook: bookItem)
                                .onTapGesture{
                                    self.showDetailView = true
                                    self.selectedBook = bookItem
                                }
                                .contextMenu{//add long-click menu
                                    Button(action: {
                                        self.delete(item: bookItem)
                                    }){
                                        HStack{
                                            Text("Delete the book")
                                            Image(systemName: "trash")
                                        }
                                    }
                                    Button(action: {
                                        self.setFavorite(item: bookItem)
                                    }){
                                        HStack{
                                            Text("Add/delete my fravorite")
                                            Image(systemName: "star")
                                        }
                                    }
                                }
                        }
                    }
                }.onDelete(perform: { indexSet in
                    books = books.sorted(by: displayOrder.predicate())//2.add this line: sorted first
                    books.remove(atOffsets: indexSet)//1.!if only this line & changed order: error when delete occurs because indexSet!
                })
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
