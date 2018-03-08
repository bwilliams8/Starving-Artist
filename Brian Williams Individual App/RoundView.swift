//
//  RoundView.swift
//  Brian Williams Individual App
//
//  Created by Brian Williams
//  Copyright © 2018 ISYS 230. All rights reserved.
//

import UIKit

    @IBDesignable
    class RoundView: UIView {
        
        //This custom class is used to make the artist card on the second screen appear less sharp. Corner Radius determines exactly that, the corner radius. The larger the number, the rounder the shape. Border width and border color determine how the border of the view looks.
        
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


