//
//  AppointmentVCPresenter.swift
//  appointment
//
//  Created by Mohamed Nawar on 3/16/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//
import UIKit
protocol AppointmentView: class {
    var numberOfEmployee: Int { get }
    var numberOfSchedule: Int { get }
    func configureEmployeeCell(index:Int)-> [String:AnyObject]
    func configureScheduleCell(index:Int)-> [[String:AnyObject]]
    func nextAppointment()
    func previousAppointment()
    func getAppointment(date:String)
}
protocol AppointmentViewPresenterOutput: AnyObject {
    func updateEmployeeCollectionView()
    func previousAppointment(index:IndexPath)
    func nextAppointment(index:IndexPath)
    func setCurrentPage(current:Date)
}
class AppointmentVCPresenter : AppointmentView {
      
    private let interactor = AppointmentInteractor()
    private weak var view: AppointmentViewPresenterOutput!
    private var currentPage: Date?
    private var currentIndex = IndexPath()
    private var currentRow = 1
    private lazy var today: Date = {
           return Date()
       }()
       var employeeAppointments = [[String:AnyObject]]()

    init(view: AppointmentViewPresenterOutput ) {
        self.view = view
    }
   
  
    // get count of saved Employee
    var numberOfEmployee: Int {
        return employeeAppointments.count
    }
    // get count of saved Schedule
    var numberOfSchedule: Int {
        return employeeAppointments.count
    }
    
    // method to return Employees
    func getAppointment(date:String) {
        interactor.getAppointment(date: date) { [weak self] (employeeAppointments, error) in
            if error == nil {
                self?.employeeAppointments = employeeAppointments!
                self?.view.updateEmployeeCollectionView()
            }else{
                print(error ?? "")
                self?.view.updateEmployeeCollectionView()
            }
        }
    }
    func configureEmployeeCell(index:Int)-> [String:AnyObject] {
        print(index)
         let employeeAppointment = self.employeeAppointments[index]
        if let  employee_data = employeeAppointment["employee_data"] as? [String:AnyObject] {
                return employee_data
            }else{
              return [String:AnyObject]()
            }
        return [String:AnyObject]()
    }
    
    func configureScheduleCell(index:Int)-> [[String:AnyObject]] {
        print(index)
         let employeeAppointment = self.employeeAppointments[index]
        print(employeeAppointment)
        if let  employee_data = employeeAppointment["employee_data"] as? [String:AnyObject] {
                if let  employeeAppointment = employee_data["appointments"] as? [[String:AnyObject]] {
                    return employeeAppointment

                }else{
                  return[[String:AnyObject]]()
                }
            }else{
              return [[String:AnyObject]]()
            }
        return [[String:AnyObject]]()
    }
    func previousAppointment(){
                if currentRow-1 > 0 {
                    currentRow-=1
                    currentIndex = IndexPath(row: currentRow-1, section: 0)
                    self.view.previousAppointment(index: currentIndex)
                }else{
                    currentRow = 1
                    return
                }
    }
    func nextAppointment(){
                if currentRow+1 < employeeAppointments.count-1 {
                    currentRow+=1
                    currentIndex = IndexPath(row: currentRow+1, section: 0)
                    self.view.nextAppointment(index: currentIndex)
                }else{
                    return
                }
    }
    func moveCurrentPage(moveUp: Bool) {
        let calendar = Calendar.current
                var dateComponents = DateComponents()
                dateComponents.weekOfMonth = moveUp ? 1 : -1
        self.currentPage = calendar.date(byAdding: dateComponents, to: self.currentPage ?? self.today)
        self.view.setCurrentPage(current: self.currentPage!)

    }
}
