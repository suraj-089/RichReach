//
//  AddChannelTableViewCell.swift
//  Assignment
//
//  Created by Suraj on 5/11/20.
//  Copyright © 2020 Sample. All rights reserved.
//

import UIKit

class AddChannelTableViewCell: UITableViewCell {

    static let identifier = CellIdentifiers.addChannelTableViewCell
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    var addButtonClosure:emptyButtonClosure?
    var deleteButtonClosure:emptyButtonClosure?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        if let addButtonAction = addButtonClosure{
            addButtonAction()
        }
    }
    
    @IBAction func deleteButtonAction(_ sender: Any) {
        if let deleteButtonAction = deleteButtonClosure{
            deleteButtonAction()
        }
    }
}
