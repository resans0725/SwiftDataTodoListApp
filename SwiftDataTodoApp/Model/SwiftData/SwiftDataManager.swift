//
//  SwiftDataManager.swift
//  SwiftDataTodoApp
//
//  Created by 永井涼 on 2023/08/06.
//

import Foundation
import SwiftData

class SwiftDataManager {
    func saveContext(context: ModelContext) {
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
