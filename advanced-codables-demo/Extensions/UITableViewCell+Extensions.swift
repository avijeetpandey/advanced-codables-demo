//
//  UITableViewCell+Extensions.swift
//  advanced-codables-demo
//
//  Created by Avijeet on 01/04/24.
//

import UIKit

// MARK: - UITableViewCell + Extensions
extension UITableViewCell {
    var reuseIdentifier: String {
        String(describing: self)
    }
}
