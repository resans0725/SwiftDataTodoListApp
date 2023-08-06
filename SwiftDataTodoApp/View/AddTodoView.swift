//
//  AddTodoView.swift
//  SwiftDataTodoApp
//
//  Created by 永井涼 on 2023/08/05.
//

import SwiftUI

struct AddTodoView: View {
    @StateObject var viewModel = AddTodoViewModel()
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        contentView
    }
    
    var contentView: some View {
        VStack(alignment: .leading, spacing: 10) {
            todoTitleView
            deadLineView
            detailTextView
            HStack {
                Spacer()
                saveButton
                Spacer()
            }
            .padding(.top, 20)
            
            Spacer()
        }
        .padding(.horizontal, 20)
        
    }
    
    var todoTitleView: some View {
        VStack(alignment: .leading) {
            Text("タスク名")
            TextField("タスク名を入力してください", text: $viewModel.title)
                .padding(.leading, 20)
                .frame(width: abs(.infinity), height: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black.opacity(0.2), lineWidth: 2)
                )
        }
    }
    
    var deadLineView: some View {
        VStack(alignment: .leading) {
            Text("期限")
            DatePicker("", selection: $viewModel.deadline, displayedComponents: .date)
                .labelsHidden()
                .environment(\.locale, Locale(identifier: "ja_JP"))
        }
    }
    
    var detailTextView: some View {
        VStack(alignment: .leading) {
            Text("詳細")
            TextEditor(text: $viewModel.detail)
                .frame(width: abs(.infinity), height: 200)
                .border(Color.gray, width: 1)
        }
    }
    
    var saveButton: some View {
        Button(action: {
            dismiss()
            viewModel.onTapSaveButton(context: context)
        }) {
            Text("追加")
                .bold()
                .padding()
                .frame(width: 100, height: 50)
                .foregroundColor(Color.white)
                .background(Color.purple)
                .cornerRadius(10)
        }
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView()
    }
}
