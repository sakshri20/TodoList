//
//  ListView.swift
//  TodoList
//
//  Created by Sakshi Shrivastava on 3/5/26.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
        ItemModel(title: "This is the first item", isCompleted: false),
        ItemModel(title: "This is the second item", isCompleted: true),
        ItemModel(title: "This is the third item", isCompleted: false)
    ]
    
    var body: some View {
        List {
            ForEach(items, content: { item in
                ListRowView(item: item)
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
