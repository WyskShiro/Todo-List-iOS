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
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        rows.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        let randomTitles = [
            "Random title 1",
            "Random title 2",
            "Random title 3",
            "Random title 4",
            "Random title 5",
        ]
        let randomIndex = Int.random(in: 0..<randomTitles.count)
        rows.append(ChecklistItem(text: randomTitles[randomIndex], checked: true))
        let indexPath = IndexPath(row: rows.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    func configureCheckmark(for cell: UITableViewCell, at checklistItem: ChecklistItem) {
        if checklistItem.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
}

