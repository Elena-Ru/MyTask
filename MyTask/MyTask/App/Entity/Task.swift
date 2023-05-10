//
//  Task.swift
//  MyTask
//
//  Created by Елена Русских on 10.05.2023.
//

import Foundation

protocol Task {
  var name: String {get set}
  var parent: Task? {get set}
  var childTasks: [Task] {get set}
  var isComposite: Bool {get set}
  func getChildTasksQty() -> Int
}
