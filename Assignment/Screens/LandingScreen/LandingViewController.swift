//
//  LandingViewController.swift
//  Assignment
//
//  Created by Suraj on 5/10/20.
//  Copyright © 2020 Sample. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var channelName:String = "Sales Leads"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableHeader()
        registerXibs()
        // Do any additional setup after loading the view.
    }
    
   private func registerXibs(){
        tableView.registerCell(ChannelTableViewCell.identifier)
        tableView.registerCell(RelatedChannelsTableViewCell.identifier)
        tableView.registerCell(CommunicationTableViewCell.identifier)
        tableView.registerCell(ParticipantsTableViewCell.identifier)
        tableView.registerCell(MoreTableViewCell.identifier)
        tableView.registerCell(HeaderTableViewCell.identifier)
        tableView.registerCell(GeneralTableViewCell.identifier)
    }
    
   private func setTableHeader(){
        tableView.delegate = self
        tableView.dataSource = self
        let view = UIView(frame: CGRect(x: 0, y:0, width: UIScreen.main.bounds.width, height: 40))
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 5, width: UIScreen.main.bounds.width - 20, height: 30)
        view.addSubview(label)
        label.text = "Create Channel"
        label.font = UIFont(name: "KohinoorBangla-Semibold", size: 16)
        label.backgroundColor = UIColor.purple
        view.backgroundColor = .purple
        tableView.tableHeaderView = view
    }
}

