//
//  RegistrationView.swift
//  GetThingsDone
//
//  Created by Igor Łopatka on 06/12/2023.
//

import SwiftUI

struct RegistrationView: View {
    
    @EnvironmentObject private var model: GTDModel
    
    @State var username = ""
    @State var password = ""
    @State var errorMessage = ""
        
    var isValid: Bool {
        !username.isEmptyOrWhitespace
        && !password.isEmptyOrWhitespace
        && (password.count >= 6
        && password.count <= 10)
    }
    
    private func register() async {
        do {
            let registeredResponse = try await model.register(username: username, password: password)
            if registeredResponse.error {
                // take to login screen
            } else {
                errorMessage = registeredResponse.reason ?? ""
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Username", text: $username)
                        .textInputAutocapitalization(.never)
                    SecureField("Password", text: $password)
                    Text(errorMessage)
                }
                
                Button("Register") {
                    Task {
                        await register()
                    }
                }
                .disabled(!isValid)
                
            }
            .navigationTitle("Register")
        }
    }
}

#Preview {
    RegistrationView()
        .environmentObject(GTDModel())
}
