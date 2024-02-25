//
//  RegistrationResponse.swift
//  GetThingsDone
//
//  Created by Igor Łopatka on 11/12/2023.
//

import Foundation

struct RegistrationResponse: Codable {
    
    let error: Bool
    var reason: String?
}
