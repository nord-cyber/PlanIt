//
//  TasksController.swift
//  JustDoIt
//
//  Created by Vadzim Ivanchanka on 16.02.21.
//

import UIKit

class TasksController:UIViewController {
    let array = ["1","2","3","4"]
    //MARK: Initialization objects
    var tasks:StorageTasks?
    // initialization tableView
    var tableView:UITableView =  {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.1921568627, blue: 0.2274509804, alpha: 1)
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    //initialization topViewLogo
    let topViewLogo:TopViewLogo = {
        let mainView = TopViewLogo()
        
        mainView.translatesAutoresizingMaskIntoConstraints = false
        return mainView
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.constrainsViews()
        self.setupDelegateTableView()
    }
    
    fileprivate func setupDelegateTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // function that exposes the constraints
    fileprivate func constrainsViews () {
        // add to main view
        self.view.addSubview(tableView)
        self.view.addSubview(topViewLogo)
        
        // calculating ratio for correct proportion topViewLogo
        self.topViewLogo.frame.size = CGSize(width: self.view.frame.width, height: 240)
        let ratio = topViewLogo.frame.size.height / topViewLogo.frame.size.width
        
        // constraints elements main view
        topViewLogo.anchor(top: view.topAnchor, trailing: view.trailingAnchor, leading: view.leadingAnchor, bottom: nil, padding: UIEdgeInsets(top: 0, left: 0, bottom: 999, right: 0), size: CGSize(width: view.frame.width, height: view.frame.width * ratio))
        
        // tableview constraints
        tableView.anchor(top: topViewLogo.bottomAnchor, trailing: view.trailingAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: -70, right: 0), size: CGSize(width: self.view.frame.width, height: 600))
  
    }
    
    
    
}


extension TasksController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.taskBodyText.text = array[indexPath.row]
        cell.backgroundColor = #colorLiteral(red: 0.2, green: 0.2431372549, blue: 0.2862745098, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
  
}



