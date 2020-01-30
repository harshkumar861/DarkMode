//
//  DashboardVC.swift
//  DarkMode
//
//  Created by Apple on 29/01/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class DashboardVC: UIViewController {

    @IBOutlet weak var tbList: UITableView!
    let objDashboardVM = DashboardVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        objDashboardVM.fetchMenu {
            print(self.objDashboardVM.resultModel.categoriesArray)
        }
    }


}

