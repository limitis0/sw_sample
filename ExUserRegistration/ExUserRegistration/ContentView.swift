//
//  ContentView.swift
//  ExUserRegistration
//
//  Created by  Ting-Wei Lee on 2020/8/11.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var userRegViewMod = UserRegistrationViewModel()
    var body: some View {
        VStack{
            Text("建立帳號")
                .font(.title)
                .bold()
                .padding(.bottom, 10)
            FormFieldView(fieldName: "UserName",
                          fieldValue: $userRegViewMod.username,
                          isSecure: false)
            RequirementTextView(
                iconName: userRegViewMod.isUsernameLengthValid ? "lock.open":"lock",
                iconColor: userRegViewMod.isUsernameLengthValid ? Color.green : Color.red,
                text: "at least 4 charactors",
                isStrikeThrough: userRegViewMod.isUsernameLengthValid)
                .padding()
            FormFieldView(fieldName: "Password",
                          fieldValue: $userRegViewMod.password,
                          isSecure: true)
            VStack{
                RequirementTextView(
                    iconName: userRegViewMod.isPasswordLengthValid ? "lock.open":"lock",
                    iconColor: userRegViewMod.isPasswordLengthValid ? Color.green : Color.red,
                    text: "at least 8 charactors",
                    isStrikeThrough: userRegViewMod.isPasswordLengthValid)
                RequirementTextView(
                    iconName: userRegViewMod.isPasswordCapitalLetter ? "lock.open":"lock",
                    iconColor: userRegViewMod.isPasswordCapitalLetter ? Color.green : Color.red,
                    text: "at least 1 capital charactors",
                    isStrikeThrough: userRegViewMod.isPasswordCapitalLetter)
            }.padding()
            FormFieldView(fieldName: "Confirm Password",
                          fieldValue: $userRegViewMod.passwordConfirm,
                          isSecure: true)
            RequirementTextView(
                iconName: userRegViewMod.isPasswordConfirmValid ? "lock.open":"lock",
                iconColor: userRegViewMod.isPasswordConfirmValid ? Color.green : Color.red,
                text: "enter same password again",
                isStrikeThrough: userRegViewMod.isPasswordConfirmValid)
                .padding()
                .padding(.bottom, 15)
            Button(action: {}){
                Text("Sign Up")
                    .font(.body)
                    .foregroundColor(.white)
                    .bold()
                    .padding(.all, 10)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(
                        LinearGradient(
                            gradient: Gradient(
                                colors:[
                                    Color(red: 251/255, green: 128/255, blue: 128/255),
                                    Color(red: 253/255, green: 193/255, blue: 104/255)]),
                            startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            HStack{
                Text("Already have an account?")
                    .font(.body)
                Button(action: {}){
                    Text("Sign in")
                        .font(.body)
                        .foregroundColor(Color(red: 251/255, green: 128/255, blue: 128/255))
                }
            }.padding(.top, 10)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
