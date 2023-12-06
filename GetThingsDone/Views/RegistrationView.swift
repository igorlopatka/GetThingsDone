//
//  RegistrationView.swift
//  GetThingsDone
//
//  Created by Igor Łopatka on 06/12/2023.
//

import SwiftUI

struct RegistrationView: View {
    
    @State var username = ""
    @State var password = ""
    
    var isValid: Bool {
        !username.isEmptyOrWhitespace
        && !password.isEmptyOrWhitespace
        && (password.count >= 6
        && password.count <= 10)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Username", text: $username)
                    SecureField("Password", text: $password)
                }
                
                Button("Register") {
                    
                }
                .disabled(!isValid)
            }
            .navigationTitle("Register")
        }
    }
}

#Preview {
    RegistrationView()
}
