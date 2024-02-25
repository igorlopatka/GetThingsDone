//
//  LoginResponse.swift
//  GetThingsDone
//
//  Created by Igor Łopatka on 12/12/2023.
//

import Foundation

struct LoginResponse: Codable {
    
    let error: Bool
    var reason: String? = nil
    var token: String? = nil
    var userID: UUID? = nil
}
