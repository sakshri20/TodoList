//
//  ListRowView.swift
//  TodoList
//
//  Created by Sakshi Shrivastava on 3/5/26.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview("List rows", traits: .sizeThatFitsLayout) {
    let item1 = ItemModel(id: UUID().uuidString, title: "This is the first item", isCompleted: false)
    let item2 = ItemModel(id: UUID().uuidString, title: "This is the second item", isCompleted: true)
    
    NavigationStack {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
    }
}
