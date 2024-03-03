//
//  GTDModel.swift
//  GetThingsDone
//
//  Created by Igor Łopatka on 11/12/2023.
//

import Foundation
import GettingThingsDoneSharedDTO

class GTDModel: ObservableObject {
    
    let client = HTTPClient()
    
    func register(username: String, password: String) async throws -> RegistrationResponseDTO {
        
        //model
        let registerData = ["username": username, "password": password]
        let resource = Resource(url: Constants.URLs.register, method: .post(try! JSONEncoder().encode(registerData)), modelType: RegistrationResponseDTO.self)
        let registerResponse = try await client.load(resource)
        return registerResponse
    }
    
    func login(username: String, password: String) async throws -> LoginResponseDTO {

        let loginData = ["username": username, "password": password]
        let resource = Resource(url: Constants.URLs.login, method: .post(try! JSONEncoder().encode(loginData)), modelType: LoginResponseDTO.self)
        let loginResponse = try await client.load(resource)
        if !loginResponse.error && loginResponse.token != nil && loginResponse.userID != nil {
            // save to user defaults
            let defaults = UserDefaults.standard
            defaults.set(loginResponse.token!, forKey: "authToken")
            defaults.set(loginResponse.userID!.uuidString, forKey: "userID")
        }
        return loginResponse
    }
}
