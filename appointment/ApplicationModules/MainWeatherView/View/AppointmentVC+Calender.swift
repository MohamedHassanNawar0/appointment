//
//  AppointmentVC+Calender.swift
//  appointment
//
//  Created by Mohamed Nawar on 3/16/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit
import FSCalendar

extension AppointmentVC: FSCalendarDelegate {
    func setupView() {
        self.title = "Appointment"
             calenderView.delegate = self
             calenderView.scope = .week
             calenderView.appearance.headerMinimumDissolvedAlpha = 0
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        presenter.getAppointment(date: date.string(format: "yyyy-MM-dd"))
    }
}
