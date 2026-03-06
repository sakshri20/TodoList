//
//  ListRowView.swift
//  TodoList
//
//  Created by Sakshi Shrivastava on 3/5/26.
//

import SwiftUI

struct ListRowView: View {
    
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
                .font(.headline)
            Text(title)
            Spacer()
        }
    }
}

#Preview {
    NavigationStack {
        ListRowView(title: "This is the first item")
    }
}
