//
//  RoundButton.swift
//  Brian Williams Individual App
//
//  Created by Brian Williams
//  Copyright © 2018 ISYS 230. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {

    //This custom class is used to make the round "Go" button on the main screen. Corner Radius determines exactly that, the corner radius. The larger the number, the rounder the shape. Border width and border color determine how the border of the button looks.
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
