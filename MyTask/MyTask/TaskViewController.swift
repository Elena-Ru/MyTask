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
    // Do any additional setup after loading the view.
  }
  
  //MARK: ObjCMethods
  @objc private func dismissSelf() {
    print("add")
  }
  
}

//MARK: Extensions
extension TaskViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard  let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.identifier, for: indexPath) as? TaskTableViewCell else {
      return UITableViewCell()}
    return cell
  }
}

