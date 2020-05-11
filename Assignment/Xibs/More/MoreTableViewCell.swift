//
//  MoreTableViewCell.swift
//  Assignment
//
//  Created by Suraj on 5/10/20.
//  Copyright © 2020 Sample. All rights reserved.
//

import UIKit
typealias emptyButtonClosure = () -> ()

class MoreTableViewCell: UITableViewCell {
    
    static let identifier = CellIdentifiers.moreTableViewCell
    var emptyButtonAction:emptyButtonClosure? = nil
    
    @IBOutlet weak var createButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        createButton.clipsToBounds = true
        createButton.layer.cornerRadius = 15
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func createButtonAction(_ sender: Any) {
        if let buttonAction = emptyButtonAction{
            buttonAction()
        }
    }
    
}
