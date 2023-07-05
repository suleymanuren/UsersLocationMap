//
//  MapView.swift
//  MapApp
//
//  Created by Bulut Sistem on 5.07.2023.
//

import SwiftUI
import CoreLocation
import MapKit
import _CoreLocationUI_SwiftUI

struct MapView: View {
    @StateObject var userDataService = UserDataService()
    @StateObject var locationManager = LocationManager()

    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.33, longitude: -122.02), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
    @State private var selectedUser: Results? = nil
    @State private var openPopup = false
    

    var body: some View {
        ZStack {
            if userDataService.userData.isEmpty {
                Text("Loading...")
            } else {
                Map(
                    coordinateRegion: $region,
                    interactionModes: .all,
                    showsUserLocation: true,
                    userTrackingMode: .none,
                    annotationItems: mapAnnotationItems()) { item in
                    MapAnnotation(coordinate: (item.location?.coordinates?.coordinate)!) {
                        MapAnnotations()
                            .onTapGesture {
                                openPopup = true
                                selectedUser = item
                                withAnimation{
                                    region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: item.location?.coordinates?.coordinate?.latitude ?? 0.0, longitude: item.location?.coordinates?.coordinate?.longitude ?? 0.0), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
                                }
                                
                            }
                        
                        
                    }
                        
                }
                    .overlay(
                    
                    HStack{
                        if let selectedUser = selectedUser {
                            if openPopup {
                                withAnimation {
                                    HStack{
                                        UserDetailCard(user: selectedUser, openPopup: self.$openPopup)
                                    }
                                }
                            }
                            
                        }
                    }
                        .padding(.bottom,15)
                    ,alignment: .bottom
                )
                if !openPopup {
                    LocationButton(.currentLocation, action: {
                        withAnimation {
                            if let currentLocation = locationManager.location {
                                region = MKCoordinateRegion(
                                    center: currentLocation,
                                    span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                                )
                            }

                        }
                    })

                    .labelStyle(.iconOnly)
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity ,maxHeight: .infinity, alignment: .bottomTrailing)
                    .padding()
                    .cornerRadius(12)
                }
                
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            userDataService.getUsers()
            
        }
   
    }
    
    private func mapAnnotationItems() -> [Results] {
        return userDataService.userData.compactMap { user in
            if let latitude = user.location?.coordinates?.latitude,
                let longitude = user.location?.coordinates?.longitude {
                return user
            } else {
                return nil
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
