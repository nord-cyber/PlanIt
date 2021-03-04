//
//  StorageTasks.swift
//  JustDoIt
//
//  Created by Vadzim Ivanchanka on 16.02.21.
//



import UIKit

class StorageTasks:StorageTasksDelegate {
    
    // constants
    fileprivate let keyForUser = "keyTasks"
    fileprivate let ud = UserDefaults()
    
    
    // save tasks in UD
    func saveTasks(tasks:[DataFields]) {
        if tasks.isEmpty {
            self.ud.setValue(nil, forKey: keyForUser)
            return
        }
            guard let encoded = try? JSONEncoder().encode(tasks) else
            { print("Can't save task data")
                return
            }
            self.ud.setValue(encoded, forKey: keyForUser)
          
    }
    
    // get data tasks
    func getTasksValue() -> [DataFields]? {
         
           let dataFields = decoder()
            return dataFields
    }
    
    // remove from tasks object
    func removeTask(_ indexPathRow: Int) {
        
        guard var data = decoder() else { return }
        data.remove(at: indexPathRow)
        DispatchQueue.main.async {[unowned self] in
            saveTasks(tasks: data)
        }
      
    }
    
    fileprivate func decoder() -> [DataFields]? {
        guard let data =  self.ud.value(forKey: keyForUser) as? Data,
              let dataField = try? JSONDecoder().decode([DataFields].self, from: data) else { return nil}
        return dataField
    }
}
