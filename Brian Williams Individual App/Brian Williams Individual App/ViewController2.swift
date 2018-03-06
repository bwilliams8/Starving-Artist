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

// ^ will not do this, can do the same with a single card. after animating first card out, randomly pick a different artist from array artists, set labels to match array text, change image based on the artist. Animate card back in from bottom and repeat functionality.

class ViewController2: UIViewController {
    

    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var artistCard: RoundView!
    @IBOutlet weak var artistUsername: UILabel!
    @IBOutlet weak var artistRealName: UILabel!
    @IBOutlet weak var artistCreation: UILabel!
    @IBOutlet weak var artistImage: UIImageView!
    @IBOutlet weak var thumbImageView: UIImageView!
    
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
        
        let randomIndex = Int(arc4random_uniform(UInt32(artists.count)))
        // unsure of this thus far
        

    }
    
    @IBAction func panArtistCard(_ sender: UIPanGestureRecognizer) {
        let artistCard = sender.view!
        let point = sender.translation(in: view)
        let xFromCenter = artistCard.center.x - view.center.x
        
        if xFromCenter > 0 {
            thumbImageView.image = #imageLiteral(resourceName: "thumbup")
            thumbImageView.tintColor = UIColor.green
        } else {
            thumbImageView.image = #imageLiteral(resourceName: "thumbdown")
            thumbImageView.tintColor = UIColor.red
        }
        
        thumbImageView.alpha = abs(xFromCenter) / view.center.x
        
        artistCard.center = CGPoint(x: view.center.x + point.x, y: view.center.y)
        
        if sender.state == UIGestureRecognizerState.ended {
            
            if artistCard.center.x < 75 {
                UIView.animate(withDuration: 0.5, animations: {
                    artistCard.center = CGPoint(x: artistCard.center.x - 200, y: artistCard.center.y + 75)
                    artistCard.alpha = 0
                }, completion: {(true) in
                    // RIGHT HERE, randomly pick artist from array, change label and imageview based on picked artist.
                    artistCard.center = CGPoint(x: self.view.center.x, y: self.view.center.x + 300)
                    UIView.animate(withDuration: 1, animations: {
                        artistCard.center = self.view.center
                        artistCard.alpha = 0.9
                    }, completion: {(true) in
                        return})
                })
            } else if artistCard.center.x > (view.frame.width - 75) {
                UIView.animate(withDuration: 0.5, animations: {
                    artistCard.center = CGPoint(x: artistCard.center.x + 200, y: artistCard.center.y + 75)
                    artistCard.alpha = 0
                }, completion: {(true) in
                    // Here as well, previous comment.
                    artistCard.center = CGPoint(x: self.view.center.x, y:self.view.center.x + 300)
                    UIView.animate(withDuration: 1, animations: {
                        artistCard.center = self.view.center
                        artistCard.alpha = 0.9
                    }, completion: {(true) in
                        return
                    })
                })
            }
            //UIView.animate(withDuration: <#T##TimeInterval#>, animations: <#T##() -> Void#>, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
        UIView.animate(withDuration: 0.5) {
            artistCard.center = self.view.center
            self.thumbImageView.alpha = 0
            }
        }
    }
    

}
