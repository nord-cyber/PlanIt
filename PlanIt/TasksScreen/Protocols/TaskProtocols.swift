//
//  StorageProtocols.swift
//  PlanIt
//
//  Created by Vadzim Ivanchanka on 22.02.21.
//

import Foundation


protocol StorageTasksDelegate: class {
    func saveTasks(tasks:[DataFields])
    func getTasksValue() -> [DataFields]?
    func removeTask(_ indexPathRow:Int)
}

protocol EditingTaskDelegate: class {
    func presentEditingScreen(to cell: CustomCell?)
}

protocol AddNewTaskDelegate: class {
    func addNewTask()
}
