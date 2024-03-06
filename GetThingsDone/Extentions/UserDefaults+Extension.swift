//
//  UserDefaults+Extension.swift
//  GetThingsDone
//
//  Created by Igor Łopatka on 06/03/2024.
//

import Foundation

extension UserDefaults {
    var userID: UUID? {
        get {
            guard let userIDasString = string(forKey: "userID") else {
                return nil
            }
            
            return UUID(uuidString: userIDasString)
        }
        
        set {
            set(newValue?.uuidString, forKey: "userID")
        }
    }
}
