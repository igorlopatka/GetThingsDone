//
//  GetThingsDoneApp.swift
//  GetThingsDone
//
//  Created by Igor Łopatka on 04/12/2023.
//

import SwiftUI

@main
struct GetThingsDoneApp: App {
    
    @StateObject private var model = GTDModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
