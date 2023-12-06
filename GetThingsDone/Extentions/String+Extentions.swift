//
//  String+Extentions.swift
//  GetThingsDone
//
//  Created by Igor Łopatka on 06/12/2023.
//

import Foundation

extension String {
    
    var isEmptyOrWhitespace: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
