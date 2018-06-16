//
//  ResultViewController.swift
//  RoshamboApplication
//
//  Created by Sai Venkata Pranay Boggarapu on 6/16/18.
//  Copyright © 2018 Sai Venkata Pranay Boggarapu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    //MARK:- Modal data
    var winnerImageName: String?
    var winningMessage: String?
    
    //MARK:- IBOutlets to modify images and winning text
    @IBOutlet var winnerImageView: UIImageView!
    @IBOutlet var winningMessageLabel: UILabel!
    
    //MARK:- View load
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //MARK: Populate the winning image
        if let winnerImageName = self.winnerImageName {
            self.winnerImageView.image = UIImage(named: "\(winnerImageName)")
        } else {
            self.winnerImageView.image = nil
        }
        
        //MARK:Populate the winning text
        if let winningMessage = self.winningMessage {
            self.winningMessageLabel.text = winningMessage
        } else {
            self.winningMessageLabel.text = nil
        }
        
    }

    //MARK:- Play again function
    @IBAction func playAgain() {
        dismiss(animated: true, completion: nil)
    }
}
