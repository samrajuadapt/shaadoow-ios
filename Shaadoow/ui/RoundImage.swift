//
//  RoundImage.swift
//  Shaadoow
//
//  Created by AdaptME on 28/09/2020.
//  Copyright © 2020 AdaptME. All rights reserved.
//

import Foundation
import UIKit

class RoundImageView: UIImageView {
    
    override func layoutSubviews() {
        let radius = CGFloat(40)
        layer.cornerRadius = radius
        layer.borderWidth = 1
        layer.borderColor = UIColor.clear.cgColor
        layer.masksToBounds = true

        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath
        layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}
