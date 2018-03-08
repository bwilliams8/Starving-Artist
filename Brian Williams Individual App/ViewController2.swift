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
    @IBOutlet weak var thumbImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
// Originally / If this were to be a complete, fully functional app, a random index would have picked from this class to determine which artist is shown on screen. This is shown below, as originally I had planned to implement this functionality. For demonstrational purposes, this is unnecessary. Alternatively, in a fully functional app, a random index could pick only one variable (Username for instance), and change the others (real name, creation, image) based on the username selected.
        
        //class artist {
            //var artistUsernameString: String
            //var artistRealNameString: String
            //var artistCreationString: String
            //init(artistUserNameString: String, artistRealNameString:String, artistCreationString:String)
            //{
                //self.artistUsernameString = artistUserNameString
                //self.artistRealNameString = artistRealNameString
                //self.artistCreationString = artistCreationString
            //}
        //}
        
        //var artists: [artist] = []
        
        //let psychicpebbles = artist(artistUserNameString: "PsychicPebbles", artistRealNameString: "Zach Hadel", artistCreationString: "Hellbenders")
        //let yotam = artist(artistUserNameString: "Yotam Perel", artistRealNameString: "", artistCreationString: "Youtube Animations")
        //let auntydonna = artist(artistUserNameString: "Aunty Donna", artistRealNameString: "Numerous", artistCreationString: "Short Films")
        
        //artists.append(psychicpebbles)
        //artists.append(yotam)
        //artists.append(auntydonna)
        
        //let randomIndex = Int(arc4random_uniform(UInt32(artists.count)))

        artistUsername.text = "PsychicPebbles"
        artistRealName.text = "Zach Hadel"
        artistCreation.text = "Hellbenders"
        artistImage.image = #imageLiteral(resourceName: "hellbenders")

        
        // Make sure that the starting function below psychicpebblesCard() begins with psychicpebbles information, and that the icons for patreon & twitter begin invisible

    }
    

    


    
    
    
    @IBAction func panArtistCard(_ sender: UIPanGestureRecognizer) {
        let artistCard = sender.view!
        let point = sender.translation(in: view)
        let xFromCenter = artistCard.center.x - view.center.x
        // Setting up the ability to pan with these frequently used constants.
        if xFromCenter > 0 {
            thumbImageView.image = #imageLiteral(resourceName: "thumbup")
            thumbImageView.tintColor = UIColor.green
        } else {
            thumbImageView.image = #imageLiteral(resourceName: "thumbdown")
            thumbImageView.tintColor = UIColor.red
        }
        //If the card is panned to the right, show a thumbs up and color it green. If the card is panned to the left, show a thumbs down and color it red.
        thumbImageView.alpha = abs(xFromCenter) / view.center.x
        //The thumb icon (whether up or down) should be invisible by default, to not obscure the card. To make it appear gradually, dividing the distance from center by the value of the center will make it fade in the further away it becomes. By default however, xFromCenter can provide a negative number, which is why we take the absolute value of it.
        artistCard.center = CGPoint(x: view.center.x + point.x, y: view.center.y)
        //This is the functionality to actually make the card movebased on where you click. Only horizontally, as making the card pan vertically as well would be offputting.
        if sender.state == UIGestureRecognizerState.ended {
//When the user is no longer pressing the screen:
            self.psychicpebblesCard()
        }
    }
    
// The following functions are essentially identical to eachother, however each changes the labels and image to the next's, in a loop.
    
    func psychicpebblesCard() {
        if artistCard.center.x < 75 {
            UIView.animate(withDuration: 0.5, animations: {
                self.artistCard.center = CGPoint(x: self.artistCard.center.x - 200, y: self.artistCard.center.y + 75)
                self.artistCard.alpha = 0
                //When the card is dragged 75 away from the center of the screen and the user releases, the card is animated off the screen and made invisible.
            }, completion: {(true) in
                self.artistUsername.text = "Aunty Donna"
                self.artistRealName.text = "Numerous"
                self.artistCreation.text = "Short Films"
                self.artistImage.image = #imageLiteral(resourceName: "AuntyDonna")
                //Normally, this is where the randomization would occur. For demonstration purposes, it simply changes to the next artist.
                self.artistCard.center = CGPoint(x: self.view.center.x, y: self.view.center.x + 300)
                UIView.animate(withDuration: 1, animations: {
                    self.artistCard.center = self.view.center
                    self.artistCard.alpha = 0.9
                    //Card is animated back into scene
                }, completion: {(true) in
                    self.auntydonnaCard()
                    
                })
            })
        } else if artistCard.center.x > (view.frame.width - 75) {
            UIView.animate(withDuration: 0.5, animations: {
                self.artistCard.center = CGPoint(x: self.artistCard.center.x + 200, y: self.artistCard.center.y + 75)
                self.artistCard.alpha = 0
                // Same concept as before, 75 away -> animated off the screen.
            }, completion: {(true) in
                self.artistUsername.text = "Aunty Donna"
                self.artistRealName.text = "Numerous"
                self.artistCreation.text = "Short Films"
                self.artistImage.image = #imageLiteral(resourceName: "AuntyDonna")
                //Normally, this is where the randomization would occur. For demonstration purposes, it simply changes to the next artist.
                self.artistCard.center = CGPoint(x: self.view.center.x, y:self.view.center.x + 300)
                UIView.animate(withDuration: 1, animations: {
                    self.artistCard.center = self.view.center
                    self.artistCard.alpha = 0.9
                    //Card is animated back into scene
                }, completion: {(true) in
                    self.auntydonnaCard()
                })
            })
        }

        UIView.animate(withDuration: 0.5) {
            self.artistCard.center = self.view.center
            self.thumbImageView.alpha = 0
            //If the user releases their press and the card is not 75 away in either direction, reset the card's position to center and make the thumb invisible once again.
        }
    }
    
    //I did not include comments for the following two functions, as they are exactly the same as the one previously.
    
    func auntydonnaCard() {
        if artistCard.center.x < 75 {
            UIView.animate(withDuration: 0.5, animations: {
                self.artistCard.center = CGPoint(x: self.artistCard.center.x - 200, y: self.artistCard.center.y + 75)
                self.artistCard.alpha = 0
            }, completion: {(true) in
                self.artistUsername.text = "Yotam Perel"
                self.artistRealName.text = ""
                self.artistCreation.text = "Youtube Animations"
                self.artistImage.image = #imageLiteral(resourceName: "yotam")
                self.artistCard.center = CGPoint(x: self.view.center.x, y: self.view.center.x + 300)
                UIView.animate(withDuration: 1, animations: {
                    self.artistCard.center = self.view.center
                    self.artistCard.alpha = 0.9
                }, completion: {(true) in
                    self.yotamCard()
                    
                })
            })
        } else if artistCard.center.x > (view.frame.width - 75) {
            UIView.animate(withDuration: 0.5, animations: {
                self.artistCard.center = CGPoint(x: self.artistCard.center.x + 200, y: self.artistCard.center.y + 75)
                self.artistCard.alpha = 0
            }, completion: {(true) in
                self.artistUsername.text = "Yotam Perel"
                self.artistRealName.text = ""
                self.artistCreation.text = "Youtube Animations"
                self.artistImage.image = #imageLiteral(resourceName: "yotam")
                self.artistCard.center = CGPoint(x: self.view.center.x, y:self.view.center.x + 300)
                UIView.animate(withDuration: 1, animations: {
                    self.artistCard.center = self.view.center
                    self.artistCard.alpha = 0.9
                }, completion: {(true) in
                    self.yotamCard()
                })
            })
        }
        
        UIView.animate(withDuration: 0.5) {
            self.artistCard.center = self.view.center
            self.thumbImageView.alpha = 0
        }
    }

    func yotamCard() {
        if artistCard.center.x < 75 {
            UIView.animate(withDuration: 0.5, animations: {
                self.artistCard.center = CGPoint(x: self.artistCard.center.x - 200, y: self.artistCard.center.y + 75)
                self.artistCard.alpha = 0
            }, completion: {(true) in
                self.artistUsername.text = "PsychicPebbles"
                self.artistRealName.text = "Zach Hadel"
                self.artistCreation.text = "Hellbenders"
                self.artistImage.image = #imageLiteral(resourceName: "hellbenders")
                self.artistCard.center = CGPoint(x: self.view.center.x, y: self.view.center.x + 300)
                UIView.animate(withDuration: 1, animations: {
                    self.artistCard.center = self.view.center
                    self.artistCard.alpha = 0.9
                }, completion: {(true) in
                    self.psychicpebblesCard()
                    
                })
            })
        } else if artistCard.center.x > (view.frame.width - 75) {
            UIView.animate(withDuration: 0.5, animations: {
                self.artistCard.center = CGPoint(x: self.artistCard.center.x + 200, y: self.artistCard.center.y + 75)
                self.artistCard.alpha = 0
            }, completion: {(true) in
                self.artistUsername.text = "PsychicPebbles"
                self.artistRealName.text = "Zach Hadel"
                self.artistCreation.text = "Hellbenders"
                self.artistImage.image = #imageLiteral(resourceName: "hellbenders")
                self.artistCard.center = CGPoint(x: self.view.center.x, y:self.view.center.x + 300)
                UIView.animate(withDuration: 1, animations: {
                    self.artistCard.center = self.view.center
                    self.artistCard.alpha = 0.9
                }, completion: {(true) in
                    self.psychicpebblesCard()
                })
            })
        }
        
        UIView.animate(withDuration: 0.5) {
            self.artistCard.center = self.view.center
            self.thumbImageView.alpha = 0
        }
    }
    


    

}
