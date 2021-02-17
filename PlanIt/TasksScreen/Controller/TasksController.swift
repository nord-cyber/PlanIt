//
//  TasksController.swift
//  JustDoIt
//
//  Created by Vadzim Ivanchanka on 16.02.21.
//

import UIKit

class TasksController:UIViewController {
    
    //MARK: Initialization objects
    let array = ["1","2","3","4","5"]
    
    // initialization tableView
    var tableView:UITableView =  {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
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
        self.view.backgroundColor = .systemBackground
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        self.constrainsViews()
        
    }
    
    private func constrainsViews () {
        
        self.view.addSubview(topViewLogo)
        
        
        // top logo view constraints
        NSLayoutConstraint.activate([
        topViewLogo.topAnchor.constraint(equalTo: self.view.topAnchor),
        topViewLogo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        topViewLogo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
        topViewLogo.heightAnchor.constraint(greaterThanOrEqualTo: self.view.heightAnchor, multiplier: 1/3.5)])
        
        
        // table view constraints
        NSLayoutConstraint.activate([
        tableView.topAnchor.constraint(equalTo: topViewLogo.bottomAnchor, constant: 10),
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/1.6),
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)])
        
    }
    
    
    
}


extension TasksController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }
  
}
