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
    @StateObject private var appState = ApplicationState()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $appState.routes) {
                RegistrationView()
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                        case .register:
                            RegistrationView()
                        case .login:
                            LoginView()
                        case .categoryList:
                            Text("Category List")
                        }
                    }
            }
            .environmentObject(model)
            .environmentObject(appState)
        }
    }
}
