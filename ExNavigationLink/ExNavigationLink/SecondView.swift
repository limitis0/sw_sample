//
//  SecondView.swift
//  ExNavigationLink
//
//  Created by Ting-Wei Lee on 2020/10/29.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        Image(systemName: "circle")
            .resizable()
            .frame(width: 100, height: 100, alignment: .center)
            .foregroundColor(.orange)
            .navigationBarTitle(Text("The second view"))
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
