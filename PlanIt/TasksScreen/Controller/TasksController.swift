//
//  TasksController.swift
//  JustDoIt
//
//  Created by Vadzim Ivanchanka on 16.02.21.
//

import UIKit

class TasksController:UIViewController, PresentDataFieldsDelegate {
    
    func presentDataFields(_ data: DataFields) {
        DispatchQueue.main.async {[unowned self] in
            tasks.append(data)
            storageDelegate?.saveTasks(tasks: tasks)
            tableView.reloadData()
        }
    }
    
   
    
    let array:[DataFields] = [DataFields(titleTask: "2", descriptionTask: "ne"),DataFields(titleTask: "3", descriptionTask: "me"),
    DataFields(titleTask: "3", descriptionTask: nil)]
    
    var presenterVariable:PresentData?

    //MARK: Initialization View objects
    
    var storageDelegate:StorageTasksDelegate?
    var tasks = [DataFields]()
    let topViewLogo = TopViewLogo()
    let bottomView = BottomView()
    var tableView:UITableView =  {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.1921568627, blue: 0.2274509804, alpha: 1)
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
  
    

   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.constrainsViews()
        if let data = self.storageDelegate?.getTasksValue() {
            self.tasks = data
        }
    }
   
    fileprivate func setup() {
        
        let viewController = self
        let storage = StorageTasks()
        viewController.storageDelegate = storage
        
        
        tableView.delegate = self
        tableView.dataSource = self
        bottomView.delegate = self
    }
  
    
    // function that exposes the constraints
    fileprivate func constrainsViews () {
        // add to main view
        let views = [tableView,topViewLogo, bottomView]
        views.forEach { view.addSubview($0)}
        
        // calculating ratio for correct proportion topViewLogo
        self.topViewLogo.frame.size = CGSize(width: self.view.frame.width, height: 240)
        let ratio = topViewLogo.frame.size.height / topViewLogo.frame.size.width
        
        // constraints elements main view
        topViewLogo.anchor(top: view.topAnchor, trailing: view.trailingAnchor, leading: view.leadingAnchor, bottom: nil, padding: UIEdgeInsets(top: 0, left: 0, bottom: 999, right: 0), size: CGSize(width: view.frame.width, height: view.frame.width * ratio))
        
        // tableview constraints
        tableView.anchor(top: topViewLogo.bottomAnchor, trailing: view.trailingAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: -70, right: 0), size: CGSize(width: self.view.frame.width, height: 600))
  
        
        // bottomView constraint
        bottomView.anchor(top: tableView.bottomAnchor, trailing: view.trailingAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    }
    
    
    
}


extension TasksController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.delegate = self
        cell.nameTask.text = tasks[indexPath.row].titleTask
        cell.backgroundColor = #colorLiteral(red: 0.2, green: 0.2431372549, blue: 0.2862745098, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.tasks.remove(at: indexPath.row)
            storageDelegate?.removeTask(indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
    
  
    
}

extension TasksController:EditingTaskDelegate {
    func presentEditingScreen(to cell: CustomCell?) {
        presentEditScreen()
    }
    
    
    fileprivate func presentEditScreen() {
        let editScreenVC:EditScreenController? = EditScreenController()
        editScreenVC?.taskVC = self
        let navVC = UINavigationController(rootViewController: editScreenVC!)
        present(navVC, animated: true)
    }
    
    
  
   
}



