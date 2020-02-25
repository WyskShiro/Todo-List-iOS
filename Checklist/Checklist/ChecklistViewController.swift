//
//  ViewController.swift
//  Checklist
//
//  Created by William Kanashiro on 24/02/20.
//  Copyright © 2020 William Kanashiro. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    var rows: [ChecklistItem] = [
        ChecklistItem(text: "Row 1"),
        ChecklistItem(text: "Row 2"),
        ChecklistItem(text: "Row 3"),
        ChecklistItem(text: "Row 4"),
        ChecklistItem(text: "Row 5"),
        ChecklistItem(text: "Row 6"),
        ChecklistItem(text: "Row 7"),
        ChecklistItem(text: "Row 8"),
        ChecklistItem(text: "Row 9"),
        ChecklistItem(text: "Row 10"),
        ChecklistItem(text: "Row 11"),
        ChecklistItem(text: "Row 12"),
        ChecklistItem(text: "Row 13"),
        ChecklistItem(text: "Row 14"),
        ChecklistItem(text: "Row 15"),
        ChecklistItem(text: "Row 16"),
        ChecklistItem(text: "Row 17"),
        ChecklistItem(text: "Row 18"),
        ChecklistItem(text: "Row 19"),
        ChecklistItem(text: "Row 20"),
        ChecklistItem(text: "Row 21"),
        ChecklistItem(text: "Row 22"),
        ChecklistItem(text: "Row 23"),
        ChecklistItem(text: "Row 24"),
        ChecklistItem(text: "Row 25"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        if let label = cell.viewWithTag(1000) as? UILabel {
            label.text = rows[indexPath.row].text
        }
        let checklistItem = rows[indexPath.row]
        configureCheckmark(for: cell, at: checklistItem)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let checklistItem = rows[indexPath.row]
            checklistItem.checked = !checklistItem.checked
            configureCheckmark(for: cell, at: checklistItem)
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func configureCheckmark(for cell: UITableViewCell, at checklistItem: ChecklistItem) {
        if checklistItem.checked {
            cell.accessoryType = .none
        } else {
            cell.accessoryType = .checkmark
        }
    }
}

