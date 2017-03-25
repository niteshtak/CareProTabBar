//
//  VisitorDetailVC.swift
//  CareProTabBarDemo
//
//  Created by Nitesh Tak on 25/03/2017.
//  Copyright © 2017 Nitesh. All rights reserved.
//

import UIKit


class VisitoDetailVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Visit"
        setUpTableView()
    }

    func setUpTableView() {
        self.tableView.separatorStyle = .none
        self.tableView.tableFooterView = UIView()
        self.tableView.contentInset.top = 0
        self.tableView.contentInset.bottom = 150
        self.tableView.contentOffset.y = -10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
