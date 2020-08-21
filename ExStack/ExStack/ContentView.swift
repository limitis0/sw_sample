//
//  ContentView.swift
//  ExStack
//
//  Created by  Ting-Wei Lee on 2020/7/28.
//

import SwiftUI
struct ContentView: View {
    var body: some View {
        VStack{
            TitleView()
                .frame(width: 150, height: 100, alignment: .top)
            UpperView()
            HStack{
                MiddleView(imageName: "chatboxes_pink")
                MiddleView(imageName: "settings_pink")
                MiddleView(imageName: "home-normal")
//                MiddleLeftView()
//                MiddleRightView()
            }
            ZStack{
                BottomView()
                Text("ABC")
                    .font(.system(size: 20))
                    .foregroundColor(.blue).padding(.all, 5)
                    .background(Color.gray)
                    .opacity(0.8)
                    .offset(x: 25, y: 12)
            }
        }
    }
    
}
struct TitleView: View {
    var body: some View {
        VStack{
            Text("Title")
                .font(.system(size: 50))
            Text("color")
                .font(.system(size: 30))
                .foregroundColor(Color(red: 75/255, green: 115/255, blue: 147/255))
        }
    }
}
struct UpperView: View {
    var body: some View{
        VStack{
            Image(systemName: "arrowtriangle.down.fill")
                .font(.system(size: 30))
                .foregroundColor(Color(red: 214/255, green: 123/255, blue: 100/255))
                .padding(.all, 15)
            Text("Upper")
                .font(.system(size: 15))
                .foregroundColor(Color(red: 75/255, green: 115/255, blue: 147/255))
        }
    }
}
struct MiddleView: View {
    var imageName: String
    var body: some View {
        VStack{
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.screenWidth/5-20, alignment: .center)
            Text(imageName.capitalized)
                .fontWeight(.light)
                .font(.system(size: 12))
                .foregroundColor(Color(red: 75/255, green: 115/255, blue: 147/255))
        }
//        .padding(.all, 2)
        .frame(minWidth: 0, idealWidth: 10, maxWidth: .infinity, minHeight: 0, idealHeight: 10, maxHeight: .infinity, alignment: .center)
    }
    
    
}
//struct MiddleLeftView: View {
//    var body: some View{
//        VStack{
//            Image(systemName: "arrowtriangle.right.fill")
//                .font(.system(size: 30))
//                .foregroundColor(Color(red: 214/255, green: 123/255, blue: 100/255))
//                .frame(width: UIScreen.screenWidth/2-20, alignment: .center)
//            Text("Left")
//                .font(.system(size: 15))
//                .foregroundColor(Color(red: 75/255, green: 115/255, blue: 147/255))
//        }
//    }
//}
//struct MiddleRightView: View {
//    var body: some View {
//        VStack{
//            Image(systemName: "arrowtriangle.left.fill")
//                .font(.system(size: 30))
//                .foregroundColor(Color(red: 214/255, green: 123/255, blue: 100/255))
//                .frame(width: UIScreen.screenWidth/2-20, alignment: .center)
//            Text("Right")
//                .font(.system(size: 15))
//                .foregroundColor(Color(red: 75/255, green: 115/255, blue: 147/255))
//        }.padding(.all, 2)
//    }
//
//}
struct BottomView: View {
    var body: some View{
        VStack{
            Image(systemName: "arrowtriangle.up.fill")
                .font(.system(size: 30))
                .foregroundColor(Color(red: 214/255, green: 123/255, blue: 100/255))
                .padding(.all, 15)
            Text("Lower")
                .font(.system(size: 15))
                .foregroundColor(Color(red: 75/255, green: 115/255, blue: 147/255))
        }
    }
}

extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
