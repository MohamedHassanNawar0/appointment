//
//  AppointmentInteractor.swift
//  appointment
//
//  Created by Mohamed Nawar on 3/15/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import Foundation
import Alamofire
import PKHUD

protocol APIServiceAppointmentProtocol {
    func getAppointment(date: String , completionHundler: @escaping ([[String:AnyObject]]?,String?) -> Void)
}

class AppointmentInteractor: APIServiceAppointmentProtocol {

    // Simulate a long waiting for fetching forecast weather for selected city
    func getAppointment(date: String, completionHundler: @escaping ([[String:AnyObject]]?, String?) -> Void) {
         let headers: HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded",
             "Accept": "application/json"
         ]
         let url = "https://lamsahbeauty.com/system/api/get-salons-appointments.php"
         let par = ["lang":"en" , "salon_id" : "2" , "date":date ]
         HUD.show(.progress)
      NetworkRequest().Request(url: url, method: .get, parameters: par, headers: nil){
            response , error in
            if response == nil && error == nil{
                completionHundler(nil,nil)
            }else{
                if error == nil{
                do {
                    if let jsonResult = try JSONSerialization.jsonObject(with: response?.data! ?? Data(), options: []) as? [String:AnyObject] {

                                               if let dict = jsonResult as? [String:AnyObject] {
                                                   
                                                   if let appointments = dict["appointments"] as? [[String:AnyObject]] {
                                                       

                                                       completionHundler(appointments, nil)

                                                          
                                                       HUD.hide()

                                                   }
                                               }
                                               }
                                           }catch{
                                               HUD.hide()
                                               print(error.localizedDescription)
                                           }
                }else{
                    completionHundler(nil, error?.message)
                }
            }
        }
    }
}
