//
//  AddCategoryScreen.swift
//  GetThingsDone
//
//  Created by Igor Łopatka on 06/03/2024.
//

import SwiftUI
import GettingThingsDoneSharedDTO

struct AddCategoryScreen: View {
    
    @EnvironmentObject private var model: GTDModel
    
    @State private var title: String = ""
    @State private var color: String = "#2ecc71"
    
    @Environment(\.dismiss) private var dismiss
    
    private func saveCategory() async {
        
        let categoryRequest = CategoryRequestDTO(title: title, color: color)
        
        do {
            try await model.saveCategory(categoryRequest)
        } catch {
            print(error.localizedDescription)
        }
        
        
    }
    
    private func isFormValid() -> Bool {
        !title.isEmptyOrWhitespace
    }
    
    var body: some View {
        Form {
            TextField("Title", text: $title)
            ColorSelector(colorCode: $color)
            Button("Save") {
                Task {
                    await saveCategory()
                }
            }
            .disabled(!isFormValid())
        }
        .navigationTitle("New Category")
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                Button("Close") {
                    dismiss()
                }
            }
        })
    }
}

#Preview {
    NavigationStack {
        AddCategoryScreen()
            .environmentObject(GTDModel())
    }
}
