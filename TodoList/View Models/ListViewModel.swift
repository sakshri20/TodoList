//
//  ListViewModel.swift
//  TodoList
//
//  Created by Sakshi Shrivastava on 3/7/26.
//

import Foundation
import Combine
import SwiftUI

/*
 CRUD FUNCTIONS
 
 Create - AddItem
 Read - getItem
 Update - updateItem
 Delete - deleteItem

 */

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "This is the first item", isCompleted: false),
            ItemModel(title: "This is the second item", isCompleted: true),
            ItemModel(title: "This is the third item", isCompleted: false)
        ]
        
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(indice: IndexSet, newOffset: Int) {
        items.move(fromOffsets: indice, toOffset: newOffset)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
//        if let index = items.firstIndex(where: { existingItem in
//            existingItem.id == item.id
//        })
        
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].updateStatus()
        }
    }
}
