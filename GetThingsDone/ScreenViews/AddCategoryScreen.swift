//
//  AddCategoryView.swift
//  GetThingsDone
//
//  Created by Igor Łopatka on 06/03/2024.
//

import SwiftUI

struct AddCategoryView: View {
    
    @State private var title: String = ""
    @State private var color: String = "#2ecc71"
    
    @Environment(\.dismiss) private var dismiss
    
    private func saveCategory() async {
        
    }
    
    private func isFormValid() -> Bool {
        !title.isEmptyOrWhitespace
    }
    
    var body: some View {
        Form {
            TextField("Title", text: $title)
            ColorSelector(colorCode: $color)
        }
        .navigationTitle("New Category")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Close") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    Task {
                        await saveCategory()
                    }
                }.disabled(!isFormValid)
            }
        }
    }
}

#Preview {
    NavigationStack {
        AddCategoryView()
    }
}
