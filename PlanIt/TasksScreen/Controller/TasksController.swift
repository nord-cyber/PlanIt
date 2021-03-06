//
//  TasksController.swift
//  JustDoIt
//
//  Created by Vadzim Ivanchanka on 16.02.21.
//

import UIKit

class TasksController:UIViewController, PresentDataFieldsDelegate {
    
    func presentDataFields(_ data: DataFields) {
            tasks.append(data)
            storageDelegate?.saveTasks(tasks: tasks)
            tableView.reloadData()
    }
    //MARK: Initialization View objects
    lazy var heightCoffeeControl = tableView.frame.height + bottomView.frame.height
    var presenterVariable:PresentData?
    weak var showDescriptionDelegate:ShowDescription?
    var storageDelegate:StorageTasksDelegate?
    let descriptionShow = DescriptionShowLogic()
    lazy var coffeeController = CoffeeController()
    var tasks = [DataFields]()
    let topViewLogo = TopViewLogo()
    let bottomView = BottomView()
   // let coffeeView = CoffeeView()
    var tableView:UITableView =  {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.1921568627, blue: 0.2274509804, alpha: 1)
        tableView.separatorStyle = .none
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
        viewController.showDescriptionDelegate = descriptionShow
        viewController.storageDelegate = storage
      
        
        tableView.delegate = self
        tableView.dataSource = self
        bottomView.delegate = self
        bottomView.delegateCoffee = self
        //coffeeView.delegate = self
       // coffeeView.frame = .zero
    }
    
    // function that exposes the constraints
    fileprivate func constrainsViews () {
        // add to main view
        let views = [tableView,topViewLogo, bottomView]
        views.forEach { view.addSubview($0)}
        
        
        // нужно считать само изображение а не рамку
        // calculating ratio for correct proportion topViewLogo
        
       
        // constraints elements main view
        topViewLogo.anchor(top: view.topAnchor, trailing: view.trailingAnchor, leading: view.leadingAnchor, bottom: nil, padding: UIEdgeInsets(top: 0, left: 0, bottom: 999, right: 0), size: CGSize(width: view.frame.width, height:0))
       
       // topViewLogo.heightAnchor.constraint(lessThanOrEqualToConstant: 230).isActive = true
        topViewLogo.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor, multiplier: 1/4,constant: 17).isActive = true
        
        // tableview constraints
        tableView.anchor(top: topViewLogo.bottomAnchor, trailing: view.trailingAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: -70, right: 0), size: CGSize(width: self.view.frame.width, height: 600))
  
        // bottomView constraint
        bottomView.anchor(top: tableView.bottomAnchor, trailing: view.trailingAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    }
}

extension TasksController: UITableViewDelegate, UITableViewDataSource {
    // MARK: Setup TableView methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.delegate = self
        cell.nameTask.text = tasks[indexPath.row].titleTask
        cell.taskBodyText.text = tasks[indexPath.row].descriptionTask
        cell.selectionStyle = .none
        cell.backgroundColor = #colorLiteral(red: 0.2, green: 0.2431372549, blue: 0.2862745098, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = tasks[indexPath.row]
        let height = CGFloat(cell.sizes.totalHeight)
        return height
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = tasks[indexPath.row]
        let height = CGFloat(cell.sizes.totalHeight)
        return height
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
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! CustomCell
        guard let sizesCell = showDescriptionDelegate?.showDescription(for: cell) else { return }
        if !tasks[indexPath.row].isOpen  {
            guard cell.taskBodyText.text != ConstantsEdit.placeholderTextView else { return }
                tasks[indexPath.row].isOpen = true
                tableView.beginUpdates()
                cell.descriptionMain.isHidden = false
                cell.taskBodyText.isHidden = false
                self.tasks[indexPath.row].sizes.totalHeight = sizesCell.totalHeight
                // for correct constraints
                cell.descriptionMain.frame.size.height = sizesCell.descriptionHeight
                tableView.endUpdates()
        } else {
            tableView.beginUpdates()
            tasks[indexPath.row].isOpen = false
            cell.descriptionMain.isHidden = true
            cell.taskBodyText.isHidden = true
            tasks[indexPath.row].sizes.totalHeight = ConstantSizes.heightRow
            tableView.endUpdates()
        }
        
    }
}

extension TasksController:EditingTaskDelegate {

    // MARK: Transfer to Edit Screen
    func presentEditingScreen(to cell: CustomCell?) {
        presentEditScreen(cell: cell)
    }
    fileprivate func presentEditScreen(cell:CustomCell?) {
        let editScreenVC:EditScreenController? = EditScreenController()
        if let cell = cell {
            editScreenVC?.editDataField(cell)
        } else {
            editScreenVC?.taskVC = self
        }
        let navVC = UINavigationController(rootViewController: editScreenVC!)
        present(navVC, animated: true)
    }
}
extension TasksController:ShowCoffeeDelegate {
    func showCoffeeControlView() {
        coffeeController.modalPresentationStyle = .custom
        present(coffeeController, animated: true, completion:nil)
    }
    
    /*
    fileprivate func animatedCoffeeControl(_ y:CGFloat,options:UIView.AnimationOptions) {
        UIView.animate(withDuration: 0.7, delay: 0, options: .curveEaseInOut, animations: { [unowned self] in
            self.coffeeView.frame = CGRect(x: 0, y: y, width:UIScreen.main.bounds.width, height: heightCoffeeControl)
        }, completion: nil)
    }
 
 */
}



