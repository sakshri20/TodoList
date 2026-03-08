//
//  AddButtonView.swift
//  TodoList
//
//  Created by Sakshi Shrivastava on 3/5/26.
//

import SwiftUI

struct AddButtonView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    @State var showAlert: Bool = false
    @State var alertMessage: String = ""
    
    var body: some View {
        VStack(spacing: 20){
            TextField("Write something here ...", text: $textFieldText)
                .padding(.horizontal)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                // Use a dynamic background so text/placeholder stay legible in light & dark mode
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
            
            Button(action: {
                saveButtonPressed()
            }, label: {
                Text("Save".uppercased())
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(10)
            })
            
            Spacer()
        }
        .navigationTitle("Add item 🖊️")
        .padding(14)
        .alert(isPresented: $showAlert, content: {
            getAlert()
        })
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        } else {
            showAlert.toggle()
            alertMessage = "Your new todo item must be at least 3 characters long 😱"
        }
    }
    
    func textIsAppropriate() -> Bool {
        return textFieldText.count < 3 ? false : true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertMessage))
    }
}

#Preview {
    NavigationStack {
        AddButtonView()
    }
    .environmentObject(ListViewModel())
}
