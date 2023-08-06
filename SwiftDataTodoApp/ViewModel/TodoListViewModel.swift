//
//  TodoListViewModel.swift
//  SwiftDataTodoApp
//
//  Created by 永井涼 on 2023/08/05.
//

import Foundation
import SwiftData
import SwiftUI

class TodoListViewModel: ObservableObject {
    
    
    func onTapCompletion(todo: Todo) {
        todo.completion.toggle()
    }
    
    func deleteTodo(context: ModelContext, todo: Todo) {
        context.delete(todo)
    }
    
    func stringDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.dateFormat = "yyyy年MM月dd日 "
        let strDate = dateFormatter.string(from: date)
        
        return strDate
    }
}
