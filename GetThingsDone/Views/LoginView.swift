//
//  LoginView.swift
//  GetThingsDone
//
//  Created by Igor Łopatka on 12/12/2023.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject private var model: GTDModel
//    @EnvironmentObject private var state: ApplicationState
    
    @State var username = ""
    @State var password = ""
    @State var errorMessage = ""
        
    var isValid: Bool {
        !username.isEmptyOrWhitespace
        && !password.isEmptyOrWhitespace
        && (password.count >= 6
        && password.count <= 10)
    }
    
    private func login() async {
        do {
            let loginResponse = try await model.login(username: username, password: password)
            if loginResponse.error {
                errorMessage = loginResponse.reason ?? ""
            }
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                    .textInputAutocapitalization(.never)
                SecureField("Password", text: $password)
            }
            
            Button("Login") {
                Task {
                    await login()
                }
            }
            .disabled(!isValid)
            Text(errorMessage)
            
        }
        .navigationTitle("Login")
    }
}

#Preview {
    LoginView()
}
