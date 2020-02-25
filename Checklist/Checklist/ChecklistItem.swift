//
//  ChecklistItem.swift
//  Checklist
//
//  Created by William Kanashiro on 24/02/20.
//  Copyright © 2020 William Kanashiro. All rights reserved.
//

import Foundation

class ChecklistItem {
    
    var text: String
    var checked: Bool

    init(text: String, checked: Bool = false) {
        self.text = text
        self.checked = checked
    }
}
