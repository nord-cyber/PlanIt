//
//  StorageProtocols.swift
//  PlanIt
//
//  Created by Vadzim Ivanchanka on 22.02.21.
//

import UIKit


protocol StorageTasksDelegate: class {
    func saveTasks(tasks:[DataFields])
    func getTasksValue() -> [DataFields]?
    func removeTask(_ indexPathRow:Int)
}

protocol EditingTaskDelegate: class {
    func presentEditingScreen(to cell: CustomCell?)
}


protocol  ShowDescription:class {
    func showDescription(for cell:CustomCell?) -> CellSizes?
}

protocol ConstantsSizesProtocol{
    static var paddingHeightViewsCell:UIEdgeInsets { get }
    static var fontSizeDescription:CGFloat { get }
    static var heightRow:CGFloat { get }
}
