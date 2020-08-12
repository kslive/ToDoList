//
//  ToDoListViewController.swift
//  ToDoList
//
//  Created by Eugene Kiselev on 12.08.2020.
//  Copyright © 2020 Eugene Kiselev. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var tasks: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addTask(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "New Task", message: "Add new task", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) { action in
            
            let tf =  alert.textFields?.first
            
            if let newTask = tf?.text {
                self.tasks.insert(newTask, at: 0)
                self.tableView.reloadData()
            }
        }
        
        alert.addTextField { placeholder in
            placeholder.placeholder = "Enter task"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell
    }
}
