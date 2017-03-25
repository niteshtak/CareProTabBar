//
//  SecondViewController.swift
//  CareProTabBarDemo
//
//  Created by Nitesh Tak on 23/03/2017.
//  Copyright © 2017 Nitesh. All rights reserved.
//

import UIKit

class VisitsVC: UIViewController  {

    @IBOutlet weak var visitRequestsTableView: UITableView! {
        didSet {
            visitRequestsTableView.separatorStyle = .none
            visitRequestsTableView.tableFooterView = UIView()
            visitRequestsTableView.contentInset.top = 0
            visitRequestsTableView.contentInset.bottom = 150
            visitRequestsTableView.contentOffset.y = -10
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Visits"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        backItem.tintColor = UIColor(netHex: 0xCAA640)
        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK: TableView Datasource
extension VisitsVC: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "visitorItemCell")
        cell.textLabel?.text = "Visit Request 1"
        cell.detailTextLabel?.text = "(tap to see the visitor's detail)"
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        return cell
    }
}

//MARK: TableView Delegate
extension VisitsVC: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        self.performSegue(withIdentifier: "showVisitorDetail", sender: self)
    }
}



