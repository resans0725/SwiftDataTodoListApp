//
//  AddTodoViewModel.swift
//  SwiftDataTodoApp
//
//  Created by 永井涼 on 2023/08/06.
//

import Foundation
import SwiftUI
import SwiftData

class AddTodoViewModel: ObservableObject {
    
    @Published var title: String = ""
    @Published var deadline: Date = Date()
    @Published var detail: String = ""
    @Published var categoryColor: Color = .red
    @Published var isBack = false
    
    private var swiftDataManager = SwiftDataManager()
    
    
    func onTapSaveButton(context: ModelContext) {
        isBack = false
        let todo: Todo = Todo(title: title, deadline: deadline, detail: detail, completion: false)
        context.insert(todo)
        swiftDataManager.saveContext(context: context)
    }
}
