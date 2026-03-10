//
//  ItemModel.swift
//  TodoList
//
//  Created by Sakshi Shrivastava on 3/7/26.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    var id: String = UUID().uuidString
    let title: String
    var isCompleted: Bool
    let createdAt: Date
    
    mutating func updateStatus() {
        self.isCompleted = !isCompleted
    }
}
