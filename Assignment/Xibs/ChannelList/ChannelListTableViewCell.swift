//
//  ChannelListTableViewCell.swift
//  Assignment
//
//  Created by Suraj on 5/11/20.
//  Copyright © 2020 Sample. All rights reserved.
//

import UIKit

class ChannelListTableViewCell: UITableViewCell {

    static let identifier = CellIdentifiers.channelListTableViewCell
    
    @IBOutlet weak var seperatorView: UIView!
    @IBOutlet weak var channelLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCellData(model:ChannelListModel){
        channelLabel.text = model.title
    }
    
}
