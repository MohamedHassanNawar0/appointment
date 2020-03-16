//
//  AppointmentVC.swift
//  appointment
//
//  Created by Mohamed Nawar on 3/14/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//


import UIKit
import FSCalendar
import Alamofire
import PKHUD
class AppointmentVC: UIViewController {
    
    
    @IBOutlet weak var employeeCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var calenderView: FSCalendar!
    @IBOutlet weak var scheduleCollectionView: UICollectionView!
    private(set) var presenter: AppointmentVCPresenter!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter = AppointmentVCPresenter(view: self)
        presenter.getAppointment(date: Date.getCurrentDate())
    }

       
    @IBAction func nextWeek(_ sender: Any) {
        presenter.moveCurrentPage(moveUp: true)
    }
    
    @IBAction func previousWeek(_ sender: Any) {
        presenter.moveCurrentPage(moveUp: false)
    }
    
    @IBAction func addAppointment(_ sender: Any) {
    }
    
    @IBAction func nextAppointment(_ sender: Any) {
        presenter.nextAppointment()
    }
    @IBAction func previousAppointment(_ sender: Any) {
        presenter.previousAppointment()
    }
    
}

