//
//  FormFieldView.swift
//  ExUserRegistration
//
//  Created by  Ting-Wei Lee on 2020/8/11.
//

import SwiftUI

struct FormFieldView: View {
    var fieldName = ""
    @Binding var fieldValue:String
    var isSecure = false
    var body: some View {
        VStack{
            if isSecure{
                SecureField(fieldName, text:$fieldValue)
                    .font(.system(size: 20, weight:.semibold, design:.rounded))
                    .padding(.horizontal)
            }else{
                TextField(fieldName, text:$fieldValue)
                    .font(.system(size: 20, weight:.semibold, design:.rounded))
                    .padding(.horizontal)
            }
            Divider()
                .frame(height: 1)
                .background(Color.init(red: 240/255, green: 240/255, blue: 240/255))
                .padding(.horizontal)
        }
    }
}

//struct FormFieldView_Previews: PreviewProvider {
//    static var previews: some View {
//        FormFieldView()
//    }
//}
