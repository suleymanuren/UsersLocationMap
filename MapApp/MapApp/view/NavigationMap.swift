//
//  NavigationMap.swift
//  MapApp
//
//  Created by Bulut Sistem on 6.07.2023.
//

import SwiftUI
import CoreLocation

struct NavigationMap: View {
    @State var locationManager : LocationManager
    @State var selectedUser: Results?
    @State var isNavigate = false

    var body: some View {
        VStack {
            HStack{
                Text("Yol Tarifi")
                    .frame(maxWidth: .infinity, alignment : .center)

                Image(systemName: "xmark")
                    .foregroundColor(.red)
                    .onTapGesture {
                        isNavigate = false
                    }
            }.padding()
           
            RouteMap(requestLocation: locationManager.location ?? CLLocationCoordinate2D(latitude: 0, longitude: 0),destinationLocation: selectedUser?.location?.coordinates?.coordinate ?? CLLocationCoordinate2D(latitude: 0, longitude: 0),startUser: "Konum",destinationUser: selectedUser?.name?.first ?? "")
                        .edgesIgnoringSafeArea(.all)
                
            
        }
    }
}

struct NavigationMap_Previews: PreviewProvider {
    static let locationManager = LocationManager()
    static var previews: some View {
        NavigationMap(locationManager: locationManager)
    }
}
