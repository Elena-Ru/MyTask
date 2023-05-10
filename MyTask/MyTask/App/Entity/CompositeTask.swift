//
//  CompositeTask.swift
//  MyTask
//
//  Created by Елена Русских on 10.05.2023.
//

import Foundation

class CompositeTask: Task {
  
  var childTasks: [Task] = []
  var parent: Task?
  var isComposite = false
  var name: String
  
  func getChildTasksQty() -> Int {
    return childTasks.count
  }
  
  init(name: String){
    self.name = name
  }
}
