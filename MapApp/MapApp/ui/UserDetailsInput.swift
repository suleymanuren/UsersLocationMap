//
//  UserDetailsInput.swift
//  MapApp
//
//  Created by Bulut Sistem on 5.07.2023.
//

import SwiftUI

struct UserDetailsInput: View {
    let title : String
    let text : String
    var body: some View {
        HStack{
            Text(title)
                .font(.subheadline)
                .fontWeight(.light)
            Text(text)
                .font(.footnote)
                .fontWeight(.light)
                .fixedSize()
                .frame(maxWidth: .infinity , alignment: .center)
        }
    }
}

struct UserDetailsInput_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailsInput(title: "123", text: "321")
    }
}
