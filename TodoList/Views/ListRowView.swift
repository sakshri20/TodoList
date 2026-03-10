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
        TimelineView(.periodic(from: .now, by: 1)) { context in
            HStack {
                Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                    .foregroundColor(item.isCompleted ? .green : .red)
                Text(item.title)
                Text(timeSinceString(from: item.createdAt, now: context.date))
                    .font(.caption)
                    .foregroundColor(.secondary)
                Spacer()
            }
            .font(.title2)
            .padding(.vertical, 8)
        }
    }
    
    func timeSinceString(from date: Date, now: Date) -> String {
        let seconds = Int(now.timeIntervalSince(date))
        
        if seconds < 60 {
            return "\(seconds) sec ago"
        } else if seconds < 3600 {
            let minutes = seconds / 60
            return "\(minutes) min ago"
        } else if seconds < 86400 {
            let hours = seconds / 3600
            return "\(hours) hr ago"
        } else {
            let days = seconds / 86400
            return "\(days) day ago"
        }
    }
}

#Preview("List rows", traits: .sizeThatFitsLayout) {
    let item1 = ItemModel(id: UUID().uuidString, title: "This is the first item", isCompleted: false, createdAt: .now)
    let item2 = ItemModel(id: UUID().uuidString, title: "This is the second item", isCompleted: true, createdAt: .now)
    
    NavigationStack {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
    }
}
