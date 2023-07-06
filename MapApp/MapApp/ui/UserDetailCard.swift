//
//  UserDetailCARD.swift
//  MapApp
//
//  Created by Bulut Sistem on 5.07.2023.
//

import SwiftUI
import Kingfisher

struct UserDetailCard: View {
    let user: Results // Assuming you have a User model with relevant properties

    @Binding var openPopup : Bool
    @Binding var isNavigate : Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: "arrow.uturn.forward.circle.fill")
                    .foregroundColor(.blue)
                    .onTapGesture {
                        self.isNavigate = true
                    }

                Image(systemName: "xmark")
                    .foregroundColor(.red)
                    .onTapGesture {
                        self.openPopup = false
                        self.isNavigate = false
                }
            }
            HStack{
                KFImage(URL(string: user.picture?.large ?? ""))
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(12)
                    .frame(width: 100)

                VStack{
                    Text("\(user.name?.title ?? "") \(user.name?.first ?? "") \(user.name?.last ?? "")")
                        .font(.title3)
                        .fontWeight(.light)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity , alignment: .center)

                    UserDetailsInput(title: "Country", text: user.location?.country ?? "")
                    UserDetailsInput(title: "City", text: user.location?.city ?? "")
                    UserDetailsInput(title: "Age", text: String(user.dob?.age ?? 0))
                    UserDetailsInput(title: "Phone", text: user.phone ?? "")
                    UserDetailsInput(title: "Email", text: user.email ?? "")


                }
                
            }
            
            // Add more user details as needed
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
        .padding()

    }
}


struct UserDetailCARD_Previews: PreviewProvider {
    static let user = Results ()
    static var previews: some View {
        @State var openPopup = false
        @State var isNavigate = false

        UserDetailCard(user: user,openPopup: $openPopup,isNavigate: $isNavigate)
    }
}
