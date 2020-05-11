//
//  UItableViewExtension.swift
//  Project
//
//  Created by Suraj on 5/10/20.
//  Copyright © 2020 Sample. All rights reserved.
//

import Foundation
import UIKit

extension UITableView{
    
    func registerCell(_ identifier:String){
        self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
}
