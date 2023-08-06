//
//  Todo.swift
//  SwiftDataTodoApp
//
//  Created by 永井涼 on 2023/08/05.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class Todo {
    let id = UUID()
    var title: String
    var deadline: Date
    var detail: String
    var completion: Bool
    
    init(title: String, deadline: Date, detail: String, completion: Bool) {
        self.title = title
        self.deadline = deadline
        self.detail = detail
        self.completion = completion
    }
}


