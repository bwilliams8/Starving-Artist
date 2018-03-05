//
//  ViewController2.swift
//  Brian Williams Individual App
//
//  Created by Brian Williams
//  Copyright © 2018 ISYS 230. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var artistCard: RoundView!
    @IBOutlet weak var artistUsername: UILabel!
    @IBOutlet weak var artistRealName: UILabel!
    @IBOutlet weak var artistCreation: UILabel!
    @IBOutlet weak var artistImage: UIImageView!
    
    @IBAction func panArtistCard(_ sender: UIPanGestureRecognizer) {
        let artistCard = sender.view!
        let point = sender.translation(in: view)
        artistCard.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        
        if sender.state == UIGestureRecognizerState.ended {
        UIView.animate(withDuration: 0.5) {
            artistCard.center = self.view.center
            }
        }
    }
    

}
