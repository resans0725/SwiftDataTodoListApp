//
//  ContentView.swift
//  SwiftDataTodoApp
//
//  Created by 永井涼 on 2023/08/05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                TodoListView()
                    .navigationTitle("Todoリスト")
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
