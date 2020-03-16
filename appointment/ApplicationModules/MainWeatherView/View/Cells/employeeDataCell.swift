//
//  employeeDataCell.swift
//  appointment
//
//  Created by Mohamed Nawar on 3/15/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit
import Kingfisher
class employeeDataCell: UICollectionViewCell {
    
    var employeeData = [[String:AnyObject]](){
        didSet{
            self.employeeDataTableView.reloadData()
        }
    }
    
   var allSchedule = [String]()
    @IBOutlet weak var employeeDataTableView: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        employeeDataTableView.delegate = self
        employeeDataTableView.dataSource = self
        employeeDataTableView.separatorStyle = .none
        // Initialization code
    }
}
extension employeeDataCell: UITableViewDelegate , UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0;//Choose your custom row height
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        employeeData.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = employeeDataTableView.dequeueReusableCell(withIdentifier: "DetailsCell", for: indexPath) as! DetailsCell
        let currentEmployee = employeeData[indexPath.section]
        print(currentEmployee)
            if let clientName = currentEmployee["clientName"] as? AnyObject {
                cell.customerLbl.text = "\(clientName)"
        }
                if let id = currentEmployee["id"] as? AnyObject {
                    cell.orderNumLbl.text = "\(id)"
            }
            if let time_to = currentEmployee["time_to"] as? AnyObject, let time_from = currentEmployee["time_from"] as? AnyObject  {
                              cell.timeLbl.text = "\(time_from) - \(time_to)"
                      }
            if let parent_service_name = currentEmployee["parent_service_name"] as? AnyObject {
                cell.hairCut.text = "\(parent_service_name)"
                   }else{
                return UITableViewCell()
        }
        return UITableViewCell()
    }
}
