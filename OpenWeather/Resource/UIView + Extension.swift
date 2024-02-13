//
//  UIView + Extension.swift
//  OpenWeather
//
//  Created by JinwooLee on 2/12/24.
//

import UIKit

extension UIView {
    static var identifier: String {
        return String(describing: self)
    }
    var identifier_: String {
        return String(describing: type(of: self))
    }
    
    func viewOption() {
        clipsToBounds = true
        layer.borderColor = UIColor.systemGray6.cgColor
        layer.borderWidth = 0.5
        layer.cornerRadius = 10
    }
}
