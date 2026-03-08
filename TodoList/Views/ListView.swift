//
//  ListView.swift
//  TodoList
//
//  Created by Sakshi Shrivastava on 3/5/26.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        List {
            ForEach(listViewModel.items, content: { item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear) {
                            listViewModel.updateItem(item: item)
                        }
                    }
            })
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
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
    .environmentObject(ListViewModel())
}
