//
//  ViewController.swift
//  MyTask
//
//  Created by Елена Русских on 10.05.2023.
//

import UIKit

class TaskViewController: UIViewController {
  
  //MARK: Variables
  private var rootView = TaskViewControllerRootView()
  var tasks = [Task]()
  var parentTask: Task?
  
  //MARK: VCLifeCicle
  override func loadView() {
    super.loadView()
    view = rootView
    rootView.tableView.dataSource = self
    rootView.tableView.delegate = self
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemPink
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(dismissSelf))
  }
  
  override func viewWillAppear(_ animated: Bool) {
    rootView.tableView.reloadData()
  }
  
  //MARK: ObjCMethods
  @objc private func dismissSelf() {
    let alert = UIAlertController(title: "Add new task", message: "Lets type smth", preferredStyle: .alert)
    
    alert.addTextField { field in
      field.placeholder = "Task 1"
      field.returnKeyType = .continue
    }
    
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
    alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { [weak self] _ in
      guard let field = alert.textFields else { return }
      let taskField = field[0]
      guard let task = taskField.text, !task.isEmpty else {
        print("Empty textfield")
        return
      }
      let taskItem = CompositeTask(name: task)
      self?.tasks.append(taskItem)
      
      if !(self?.parentTask?.isComposite ?? false) {
        self?.parentTask?.isComposite = true
      }
      self?.parentTask?.childTasks.append(taskItem)
      self?.rootView.tableView.reloadData()
    }))
    
    present(alert, animated: true)
  }
}

//MARK: Extensions
extension TaskViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    tasks.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard  let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.identifier, for: indexPath) as? TaskTableViewCell else {
      return UITableViewCell()}
    let qty = tasks[indexPath.row].getChildTasksQty()
    cell.textLabel?.text = ("\(tasks[indexPath.row].name) subtusks: \(qty) ")
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let nextViewController = TaskViewController()
    nextViewController.tasks = tasks[indexPath.row].childTasks
    nextViewController.parentTask = tasks[indexPath.row]
    navigationController?.pushViewController(nextViewController, animated: true)
  }
}
