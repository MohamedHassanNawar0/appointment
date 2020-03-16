//
//  UITableViewExtension.swift
//  appointment
//
//  Created by Mohamed Nawar on 3/14/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//


import Foundation
import UIKit
//MARK: - register and dequeue reusable cell of specific type
extension UITableView {
    func register<T: UITableViewCell>(_ cellType: T.Type) {
        let name = String(describing: cellType)
        let nib = UINib(nibName: name, bundle: nil)
        register(nib, forCellReuseIdentifier: name)
    }
    func dequeueReusableCell<T: UITableViewCell>(_ cellType: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: cellType), for: indexPath) as? T else {
            fatalError("\(T.self) is expected to have reusable identifier: \(String(describing: cellType))")
        }
        return cell
    }
}
