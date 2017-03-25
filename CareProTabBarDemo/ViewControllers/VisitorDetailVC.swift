//
//  VisitorDetailVC.swift
//  CareProTabBarDemo
//
//  Created by Nitesh Tak on 25/03/2017.
//  Copyright © 2017 Nitesh. All rights reserved.
//

import UIKit


class VisitoDetailVC: UITableViewController {

    var isAssignmentPerformed = false
    var visitorInfoCellIndexPath: IndexPath!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Visit"

        //Set up UI
        setUpTableView()
        setEditBarItem()
    }

    func setUpTableView() {
        self.tableView.separatorStyle = .none
        self.tableView.tableFooterView = UIView()
        self.tableView.contentInset.top = 0
        self.tableView.contentInset.bottom = 150
        self.tableView.contentOffset.y = -10
    }

    func setEditBarItem() {
        let editButton = UIButton(type: .custom)
        editButton.frame = CGRect(x: 0, y: 0, width: 60, height: 30)
        editButton.setTitle("Edit", for: .normal)
        editButton.setTitleColor(UIColor(netHex: 0xCAA640), for: .normal)
        editButton.addTarget(self, action: #selector(changeAssignmentState(button:)), for: .touchUpInside)
        let item1 = UIBarButtonItem(customView: editButton)

        self.navigationItem.setRightBarButtonItems([item1], animated: true)
        navigationController?.navigationBar.tintColor = UIColor(netHex: 0xCAA640)
    }

    //MARK: IBAction functions
    func changeAssignmentState(button: UIButton) {
        if isAssignmentPerformed {
            isAssignmentPerformed = false
            changeDefaultAvatar()
            return
        }

        isAssignmentPerformed = true
        changeDefaultAvatar()

    }

    func changeDefaultAvatar() {
        if (visitorInfoCellIndexPath != nil) {
            DispatchQueue.main.async {
                self.tableView.reloadRows(at: [self.visitorInfoCellIndexPath], with: .none)
            }
        }
    }

    //MARK : TableView delegates and datasource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
         return 4
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 1.0
        }
        return 40
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "visitorInfoCell", for: indexPath) as? VisitorInfoCell else { fatalError("Could not create cell") }
            visitorInfoCellIndexPath = indexPath
            cell.visitorAvatar.image = UIImage(named:"default_avatar")!
            if isAssignmentPerformed {
                cell.visitorAvatar.image = UIImage(named:"avatar")!
            }
            return cell
        case 1:
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "visitorScheduleCell", for: indexPath) as? VisitorScheduleCell else { fatalError("Could not create cell") }
                return cell

            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath) as? LocationCell else { fatalError("Could not create cell") }
                return cell

            case 2:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "instructionCell", for: indexPath) as? InstructionCell else { fatalError("Could not create cell") }
                return cell

            case 3:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "billingCell", for: indexPath) as? BillingCell else { fatalError("Could not create cell") }
                return cell

            default:
                return UITableViewCell()
            }

        default:
            return UITableViewCell()
        }
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.white

        let sectionTitle: String = section == 0 ? "": "Visit Details"

        let headerTitleLabel = UILabel()
        headerTitleLabel.font = UIFont(name: "Avenir", size:18);
        headerTitleLabel.textColor = UIColor(white: 0.3, alpha: 1.0)

        headerTitleLabel.text = sectionTitle

        headerTitleLabel.sizeToFit()
        headerTitleLabel.frame.origin.x += 12
        headerTitleLabel.frame.origin.y += (headerView.frame.size.height / 2) + (headerTitleLabel.frame.size.height / 2)

        headerView.addSubview(headerTitleLabel)
        
        return headerView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}




