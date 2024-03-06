//
//  Constants.swift
//  GetThingsDone
//
//  Created by Igor Łopatka on 11/12/2023.
//

import Foundation

struct Constants {
    
    private static let baseURLPath = "http://127.0.0.1:8080/api"
    
    struct URLs {
        static let register = URL(string: "\(baseURLPath)/register")!
        static let login = URL(string: "\(baseURLPath)/login")!
        
        static func saveCategory(userID: UUID) -> URL {
            return URL(string: "\(baseURLPath)/users/\(userID)/categories")!
        }
    }
}
