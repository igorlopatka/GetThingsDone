//
//  NavigationState.swift
//  GetThingsDone
//
//  Created by Igor Łopatka on 03/03/2024.
//

import Foundation

enum Route: Hashable {
    case login
    case register
    case categoryList
}

class ApplicationState: ObservableObject {
    @Published var routes: [Route] = []
}
