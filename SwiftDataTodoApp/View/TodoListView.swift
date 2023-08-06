//
//  TodoListView.swift
//  SwiftDataTodoApp
//
//  Created by 永井涼 on 2023/08/05.
//

import SwiftUI
import SwiftData

struct TodoListView: View {
    @Query private var todos: [Todo]
    @Environment(\.modelContext) var context
    @StateObject var viewModel = TodoListViewModel()
    
    var body: some View {
        contentView
    }
    
    var contentView: some View {
        ZStack(alignment: .bottomTrailing) {
            if todos.isEmpty {
                VStack {
                    emptyTodoView
                    NavigationLink(destination: AddTodoView()) {
                        Image("plus")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                }
            } else {
                todoListView
                HStack {
                    Spacer()
                    NavigationLink(destination: AddTodoView()) {
                        Image("plus")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                }
            }
        }
    }
    
    var todoListView: some View {
        ScrollView(.vertical) {
            VStack {
                ForEach(todos, id: \.title) { todo in
                    todoItem(todo: todo)
                }
            }
        }
    }
    
    func todoItem(todo: Todo) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(todo.completion ? .gray : .blue)
                .frame(width: .infinity, height: 100)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(todo.title)
                        .foregroundColor(.white)
                        .font(.system(size: 20).bold())
                    
                    if todo.completion {
                        Image("complete")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("完了")
                            .foregroundColor(.white)
                            .font(.system(size: 10).bold())
                    }
                }
                
                
                
                
                Text(todo.detail)
                    .foregroundColor(.white)
                
                HStack {
                    Text("期限：\(viewModel.stringDate(date: todo.deadline))")
                        .foregroundColor(.white)
                    
                    Button(action: {
                        viewModel.onTapCompletion(todo: todo)
                    }) {
                        Image("check")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    
                    Button(action: {
                        viewModel.deleteTodo(context: context, todo: todo)
                    }) {
                        Image("dustbox")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                }
                
            }
            .padding(.horizontal, 10)
        }
        .padding(.horizontal, 10)
    }
    
    var emptyTodoView: some View {
        VStack {
            Image("task")
                .resizable()
                .frame(width: 50, height: 50)
            Text("タスクがありません！")
                .font(.system(size: 20).bold())
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
