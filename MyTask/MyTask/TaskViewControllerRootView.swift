//
//  TaskViewControllerRootView.swift
//  MyTask
//
//  Created by Елена Русских on 10.05.2023.
//

import UIKit

class TaskViewControllerRootView: UIView {

  let tableView: UITableView = {
      let tableView = UITableView()
      tableView.translatesAutoresizingMaskIntoConstraints = false
      tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: TaskTableViewCell.identifier)
      tableView.tableFooterView = UIView()
      tableView.backgroundColor = .clear
      return tableView
  }()
  
  init() {
      super.init(frame: CGRect())
      setupLayout()
  }
  
  required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
  private func setupLayout() {
      self.addSubview(tableView)
      
      NSLayoutConstraint.activate([
          tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
          tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
          tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
          tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 12)
      ])
  }

}
