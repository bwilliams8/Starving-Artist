//
//  ViewController2.swift
//  Brian Williams Individual App
//
//  Created by Brian Williams
//  Copyright © 2018 ISYS 230. All rights reserved.
//

import UIKit

// Later, use a case to check artist's name and change artist image accordingly after animation plays.

// Have 2 artist cards, original "artistCard" is visible (0.9 alpha), the other is invisible. When user drags first off, second fades in (alpha 0 -> alpha 0.9) after animation finishes. Repeat 1-2-1-2.

class ViewController2: UIViewController {
    

    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var artistCard: RoundView!
    @IBOutlet weak var artistUsername: UILabel!
    @IBOutlet weak var artistRealName: UILabel!
    @IBOutlet weak var artistCreation: UILabel!
    @IBOutlet weak var artistImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        class artist {
            var artistUsernameString: String
            var artistRealNameString: String
            var artistCreationString: String
            init(artistUserNameString: String, artistRealNameString:String, artistCreationString:String)
            {
                self.artistUsernameString = artistUserNameString
                self.artistRealNameString = artistRealNameString
                self.artistCreationString = artistCreationString
            }
        }
        
        var artists: [artist] = []
        
        let psychicpebbles = artist(artistUserNameString: "PsychicPebbles", artistRealNameString: "Zach Hadel", artistCreationString: "Hellbenders")
        let yotam = artist(artistUserNameString: "Yotam Perel", artistRealNameString: "", artistCreationString: "Youtube Animations")
        let auntydonna = artist(artistUserNameString: "Aunty Donna", artistRealNameString: "Numerous", artistCreationString: "Short Films")
        
        artists.append(psychicpebbles)
        artists.append(yotam)
        artists.append(auntydonna)
        
        

    }
    
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
