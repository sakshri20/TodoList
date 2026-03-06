//
//  AddButtonView.swift
//  TodoList
//
//  Created by Sakshi Shrivastava on 3/5/26.
//

import SwiftUI

struct AddButtonView: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        VStack(spacing: 20){
            TextField("Write something here ...", text: $textFieldText)
                .padding(.horizontal)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
                .cornerRadius(10)
            
            Button(action: {
                
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
    }
}

#Preview {
    NavigationStack {
        AddButtonView()
    }
}
