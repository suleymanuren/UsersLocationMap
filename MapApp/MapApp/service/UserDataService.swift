//
//  UserDataService.swift
//  MapApp
//
//  Created by Bulut Sistem on 5.07.2023.
//

import Foundation
import Alamofire

@MainActor
class UserDataService : ObservableObject{
    @Published var userData = [Results] ()
    
    func getUsers() {
        let url = "https://randomuser.me/api/?results=10"
        
        AF.request (url , method: .get )
            .responseDecodable(of: UserLocationResponse.self) { response in
                if let data = response.data {
                    do {
                        let responseData = try JSONDecoder().decode(UserLocationResponse.self, from: data)
                        
                        if let userData = responseData.results {
                            DispatchQueue.main.async {
                                self.userData = userData
                            }
                        }
                    } catch {
                        print("service", String(describing: error))
                    }
                }
            }
    }
    
}
