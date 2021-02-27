//
//  StorageTasks.swift
//  JustDoIt
//
//  Created by Vadzim Ivanchanka on 16.02.21.
//


//MARK: FIX BAG WITH SAVE DATA. DESCRIPTION: WHEN REMOVE TASK FROM LIST METHOD removeTask DON'T REMOVE NECESSARY CELL

import UIKit

class StorageTasks:StorageTasksDelegate {

    fileprivate let keyForUser = "keyTasks"
    fileprivate var ud = UserDefaults()
    
    
    // save tasks in UD
    func saveTasks(tasks:[DataFields]) {
        DispatchQueue.main.async { [unowned self] in
            guard let encoded = try? JSONEncoder().encode(tasks) else
            { print("Can't save task data")
                return
            }
            self.ud.setValue(encoded, forKey: keyForUser)
        }
    }
    
    // get data tasks
    func getTasksValue() -> [DataFields]? {
        
            let decoder = JSONDecoder()
            let data = ud.value(forKey: keyForUser) as! Data
            let dataFields = try? decoder.decode([DataFields].self, from: data)
            return dataFields
    }
    
    // remove from tasks object
    func removeTask(_ indexPathRow: Int) {
            if var getTasks = getTasksValue() {
                getTasks.remove(at: indexPathRow)
                self.saveTasks(tasks: getTasks)
            }
    }
}
