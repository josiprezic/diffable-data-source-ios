//
//  TableViewController.swift
//  diffable-data-source
//
//  Created by Josip Rezic on 31/01/2020.
//  Copyright © 2020 Josip Rezic. All rights reserved.
//

import UIKit

final class TableViewController: UITableViewController {
    
    let testing = ["Jeden", "Dwa", "Trzy"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = String(describing: TableViewController.self)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testing.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self)) else {
            fatalError("\(#function): Cannot dequeue reusable cell.")
        }
        cell.textLabel?.text = testing[indexPath.row]
        return cell
    }
}
