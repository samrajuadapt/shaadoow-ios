//
//  GradientView.swift
//  Shaadoow
//
//  Created by AdaptME on 28/09/2020.
//  Copyright © 2020 AdaptME. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class GradientView: UIView {

    @IBInspectable open var topColor : UIColor = UIColor.white {
        didSet{
            setNeedsLayout()
        }
    }
    @IBInspectable open var bottomColor : UIColor = UIColor.white {
        didSet{
            setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {

        let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [bottomColor.cgColor, topColor.cgColor]
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
            gradientLayer.locations = [NSNumber(floatLiteral: 0.0), NSNumber(floatLiteral: 1.0)]
            gradientLayer.frame = self.bounds

            self.layer.insertSublayer(gradientLayer, at: 0)
        
    }
}
