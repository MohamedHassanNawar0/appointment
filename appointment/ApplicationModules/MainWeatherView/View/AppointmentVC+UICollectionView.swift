//
//  AppointmentVC+UICollectionView.swift
//  appointment
//
//  Created by Mohamed Nawar on 3/16/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit

extension AppointmentVC: UICollectionViewDataSource , UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         switch(collectionView) {
         case employeeCollectionView:
            return presenter.numberOfEmployee
         case scheduleCollectionView:
            return presenter.numberOfSchedule
         default:
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      if collectionView == scheduleCollectionView {
            let cell = scheduleCollectionView.dequeueReusableCell(withReuseIdentifier: "employeeDataCell", for: indexPath) as! employeeDataCell
        let employeeData =  presenter.configureScheduleCell(index: indexPath.item)
        print(employeeData)
        if employeeData != nil {
            cell.employeeData = employeeData
        }else{
            cell.employeeData = [[String:AnyObject]]()
        }
            return cell

        }else{
            let cell1 = employeeCollectionView.dequeueReusableCell(withReuseIdentifier: "employeeTableViewCell", for: indexPath) as! employeeTableViewCell
        let employeeData =  presenter.configureEmployeeCell(index: indexPath.item)
                    if let url = employeeData["image"] as? AnyObject {
                        cell1.employeeImage.kf.setImage(with: URL(string: "\(url)"))
                }
                        if let name = employeeData["name"] as? AnyObject {
                            cell1.employeeName.text = "\(name)"
                    }
                    return cell1

        }
    }
}

extension AppointmentVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0 , bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     if collectionView == employeeCollectionView {
        return CGSize(width: collectionView.frame.width / 3, height: 100)
        }else{
            return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height)
        }
    }
}
