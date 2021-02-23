//
//  StorageTasks.swift
//  JustDoIt
//
//  Created by Vadzim Ivanchanka on 16.02.21.
//

import UIKit

class StorageTasks:StorageTasksDelegate {
   
    
   
    fileprivate var taskVC = TasksController()
    fileprivate let keyForUserD = "keyTasks"
    fileprivate var ud = UserDefaults()
   
    init() {
        taskVC.storageDelegate = self
    }
    
    func saveTasks(tasks: [String]?) {
        guard let tasks = tasks else { return }
        self.ud.setValue(tasks, forKey: keyForUserD)
    }
    
    func getTasksValue() -> [String]? {
        guard let values = ud.value(forKey: keyForUserD) as? [String] else { return nil}
        return values
    }
    
    func removeTask(_ indexPathRow: Int) {
         ud.value(forKey: keyForUserD).map { (tasks)  in
            guard var tasks = tasks as? [String] else { return}
            tasks.remove(at: indexPathRow)
            ud.setValue(tasks, forKey: keyForUserD)
        }
    }
}
