//
//  ErrorHandler.swift
//  appointment
//
//  Created by Mohamed Nawar on 3/15/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import Foundation

class ErrorHandler : Decodable{
    var message : String?
    var cod : String?
}
struct Appointments: Decodable {
    var success: Int?
    var appointments:[AppointmentsData]?
}
class AppointmentsData : Decodable{
    var employee_data : EmployeeData?
}
class EmployeeData : Decodable{
    var id: String?
    var name: String?
    var image: String?
    var salon_id: Int?
    var parent_service_id: Int?
    var sub_service_id: Int?
    var date_added: String?
    var appointments: [AppointmentsDataContent]?
}
class AppointmentsDataContent : Decodable{
    var id: Int?
    var employee_id: Int?
    var order_id: Int?
    var clientName: String?
    var time_from: String?
    var time_to: String?
    var parent_service_name: String?
}
