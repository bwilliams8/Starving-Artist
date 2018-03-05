//
//  ViewController.swift
//  Brian Williams Individual App
//
//  Created by Brian Williams
//  Copyright © 2018 ISYS 230. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var goButton: RoundButton!
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var descriptionText: UITextField!
    @IBOutlet weak var loginButton: RoundButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImage.alpha = 0
        goButton.alpha = 0
        titleText.alpha = 0
        descriptionText.alpha = 0
        loginButton.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5, animations: {
            self.backgroundImage.alpha = 0.5
        }) { (true) in
            UIView.animate(withDuration: 0.5, animations: {
                self.titleText.alpha = 1
            }, completion: { (true) in
                UIView.animate(withDuration: 0.5, animations: {
                    self.descriptionText.alpha = 1
                }, completion: { (true) in
                    UIView.animate(withDuration: 0.5, animations: {
                        self.goButton.alpha = 1
                    }, completion: { (true) in
                        UIView.animate(withDuration: 0.5, animations: {
                            self.loginButton.alpha = 1
                        })
                    })
                })
            })
        }
    }



}

