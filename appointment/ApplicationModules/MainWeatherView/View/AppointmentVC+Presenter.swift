//
//  AppointmentVC+Presenter.swift
//  appointment
//
//  Created by Mohamed Nawar on 3/16/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import Foundation
import UIKit
extension AppointmentVC: AppointmentViewPresenterOutput {
    // move a week in calender
    func setCurrentPage(current: Date) {
        self.calenderView.setCurrentPage(current, animated: true)
    }
    // move a step in next employee Appointment
    func nextAppointment(index: IndexPath) {
        employeeCollectionView.scrollToItem(at: index, at: .right, animated: true)
        scheduleCollectionView.scrollToItem(at: index, at: .right, animated: true)
        
    }
    // move a step in previous employee Appointment
    func previousAppointment(index: IndexPath) {
        employeeCollectionView.scrollToItem(at: index, at: .left, animated: true)
        scheduleCollectionView.scrollToItem(at: index, at: .left, animated: true)
    }
    
    // reload  data view
    func updateEmployeeCollectionView() {
        employeeCollectionView.reloadData()
        scheduleCollectionView.reloadData()
    }
}
