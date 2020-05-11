//
//  HeaderTableViewCell.swift
//  Assignment
//
//  Created by Suraj on 5/10/20.
//  Copyright © 2020 Sample. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    
    static let identifier = CellIdentifiers.headerTableViewCell
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setTitle(_ section:Int){
        switch section {
        case 0:
            cellImage.image = UIImage(named: "message")
            titleLabel.text = "About Channel"
        case 2:
            titleLabel.text = "Participants"
        case 3:
            titleLabel.text = "Communications"
        default:
            titleLabel.text = "Communications"
        }
    }
    
}
