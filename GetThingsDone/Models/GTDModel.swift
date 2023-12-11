//
//  GTDModel.swift
//  GetThingsDone
//
//  Created by Igor Łopatka on 11/12/2023.
//

import Foundation

class GTDModel: ObservableObject {
    
    let client = HTTPClient()
    
    func register(username: String, password: String) async throws -> RegistrationResponse {
        
        //model
        let registerData = ["username": username, "password": password]
        let resource = Resource(url: Constants.URLs.register, method: .post(try! JSONEncoder().encode(registerData)), modelType: RegistrationResponse.self)
        let registerResponse = try await client.load(resource)
        return registerResponse
    }
}
