//
//  ListView.swift
//  TodoList
//
//  Created by Sakshi Shrivastava on 3/5/26.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [String] = [
        "This is the first item",
        "This is the second item",
        "This is the third item"
    ]
    
    var body: some View {
        List {
            ForEach(items, id: \.self, content: { item in
                    ListRowView(title: item)
            })
        }
        .navigationTitle("Todo List 📝")
        .toolbar(content: {
            ToolbarItem(
                placement: .navigationBarLeading,
                content: {
                    EditButton()
                })
            
            ToolbarItem(
                placement: .navigationBarTrailing,
                content: {
                    NavigationLink("Add",
                                   destination: {
                        AddButtonView()
                    })
                })
        })
    }
}

#Preview {
    NavigationStack {
        ListView()
    }
}
