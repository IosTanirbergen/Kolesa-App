//
//  UIView+AddSubviews.swift
//  Kolesa
//
//  Created by Dinmukhamed on 14.03.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [Any]) {
        views.forEach {
            self.addSubview($0 as! UIView)
        }
    }
}
