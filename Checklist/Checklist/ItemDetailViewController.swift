//
//  AddItemTableViewController.swift
//  Checklist
//
//  Created by William Kanashiro on 25/02/20.
//  Copyright © 2020 William Kanashiro. All rights reserved.
//

import UIKit

protocol AddItemViewControlerDelegate: class {
    func addItemViewControllerDidCancel(_ controller: ItemDetailViewController)
    func addItemViewController(
        _ controller: ItemDetailViewController,
        didFinishAdding item: ChecklistItem,
        positionToAdd position: Int?
    )
}

class ItemDetailViewController: UITableViewController {

    weak var delegate: AddItemViewControlerDelegate?
    weak var checklistItem: ChecklistItem?
    var position: Int?
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addBarButton: UIBarButtonItem!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never
        if let text = checklistItem?.text {
            textField.text = text
            navigationController?.title = text
            addBarButton.isEnabled = true
            addBarButton.title = "Edit"
        }
    }

    // MARK: - Table view data source

    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
        delegate?.addItemViewControllerDidCancel(self)
    }
    
    @IBAction func addAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        let item = ChecklistItem(text: textField.text!)
        item.checked = false
        delegate?.addItemViewController(self, didFinishAdding: item, positionToAdd: position)
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textField.becomeFirstResponder()
    }
}

extension ItemDetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let oldText = textField.text,
            let stringRange = Range(range, in: oldText) else {
                return false
        }
        
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        if newText.isEmpty {
            addBarButton.isEnabled = false
        } else {
            addBarButton.isEnabled = true
        }
        return true
    }
}
