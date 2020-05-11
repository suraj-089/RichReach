//
//  CreateChannelViewController.swift
//  Assignment
//
//  Created by Suraj on 5/10/20.
//  Copyright © 2020 Sample. All rights reserved.
//

import UIKit

protocol SendData{
    func passData(text:String)
}

class CreateChannelViewController: UIViewController {
    
    var channelList = [ChannelListModel]()
    
    @IBOutlet weak var tableView: UITableView!
    var delegate:SendData? = nil
    
    static func getInstance() -> CreateChannelViewController{
        let vc = UIStoryboard.init(name:StoryboardId.main, bundle: nil).instantiateViewController(identifier:ViewControllerIds.createChannelViewController) as! CreateChannelViewController
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        setInitials()
        channeListModel()
    }
    
    func setInitials(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerCell(CellIdentifiers.channelListTableViewCell)
        tableView.registerCell(CellIdentifiers.addChannelTableViewCell)
        tableView.transform = CGAffineTransform(scaleX: 1, y: -1)
        tableView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: tableView.bounds.size.width - 10)
    }
    
    // Adding data in channel list ------
    func channeListModel(){
        channelList.append(ChannelListModel(title: "Competition Info"))
        channelList.append(ChannelListModel(title: "Complaints"))
        channelList.append(ChannelListModel(title: "Market Info"))
        channelList.append(ChannelListModel(title: "Newsletter"))
    }
}

// MARK: - TableView DataSource and Delegate Methods
extension CreateChannelViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 1:
            return 1
        default:
            return channelList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier:AddChannelTableViewCell.identifier) as! AddChannelTableViewCell
            cell.selectionStyle = .none
            cell.addButtonClosure = {
                self.showAlert()
            }
            cell.deleteButtonClosure = {
                self.dismiss(animated: true, completion: nil)
            }
            cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier:ChannelListTableViewCell.identifier) as! ChannelListTableViewCell
            cell.setCellData(model: channelList[indexPath.row])
            cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.estimatedRowHeight = 100
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 1:
           let cell = tableView.dequeueReusableCell(withIdentifier:AddChannelTableViewCell.identifier) as! AddChannelTableViewCell
           cell.selectionStyle = .none
        default:
            self.delegate?.passData(text:channelList[indexPath.row].title)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}

// MARK: - Showing Alert
extension CreateChannelViewController{
    func showAlert(){
        let alertVC = UIAlertController(title: "Create Channel Category", message: nil, preferredStyle: .alert)
        alertVC.addTextField { (textField) in
            textField.textAlignment = .center
            textField.placeholder = "Enter Channel Name"
        }
        
        let submitAction = UIAlertAction(title: "Submit", style: .default, handler: {
            (alert) -> Void in
            self.channelList.append(ChannelListModel(title:alertVC.textFields![0].text!))
            self.tableView.reloadData()
            _ = alertVC.textFields![0] as UITextField
            
        })
        
        alertVC.addAction(submitAction)
        alertVC.view.tintColor = UIColor.black
        self.present(alertVC, animated: true)
        
    }
}
