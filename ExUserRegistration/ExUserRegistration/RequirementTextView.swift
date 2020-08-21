//
//  RequirementTextView.swift
//  ExUserRegistration
//
//  Created by  Ting-Wei Lee on 2020/8/11.
//

import SwiftUI

struct RequirementTextView: View {
    
    var iconName = "xmark.square"
    var iconColor = Color(red: 251/255, green: 128/255, blue: 128/255)
    var text = ""
    var isStrikeThrough = false
    
    var body: some View {
        HStack{
            Image(systemName: iconName)
                .foregroundColor(iconColor)
            Text(text)
                .font(.system(.body, design:.rounded))
                .foregroundColor(.secondary)
                .strikethrough(isStrikeThrough)
            Spacer()
        }
    }
}

struct RequirementTextView_Previews: PreviewProvider {
    static var previews: some View {
        RequirementTextView()
    }
}
