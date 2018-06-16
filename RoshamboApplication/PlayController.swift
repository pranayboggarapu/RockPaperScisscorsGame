//
//  ViewController.swift
//  RoshamboApplication
//
//  Created by Sai Venkata Pranay Boggarapu on 6/15/18.
//  Copyright © 2018 Sai Venkata Pranay Boggarapu. All rights reserved.
//

import UIKit

class PlayController: UIViewController {
    
    //MARK:- Variables to capture winner image and winning string message
    var winnerImage: String!
    var winningMsg: String!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK:- Moving between View controllers - way 1
    @IBAction func choosePaper() {
        //MARK: Decide who wins
        decideWinner(ItemValues.paper)
        
        //MARK:Instantiating the next view controller
        let resultController: ResultViewController = storyboard?.instantiateViewController(withIdentifier: "resultViewController") as! ResultViewController
        
        //MARK:Populating the model data
        resultController.winnerImageName = self.winnerImage
        resultController.winningMessage = self.winningMsg
        
        //MARK:Display the view controller
        present(resultController, animated: true, completion: nil)
        
    }

    //MARK:- Moving between View controllers - way 2
    @IBAction func chooseRock() {
        //MARK: Decide who wins
        decideWinner(ItemValues.rock)
        //MARK: Perform the segue
        performSegue(withIdentifier: "resultViewSegue_rock", sender: self)
    }
    
    //MARK:- Moving between View controllers - way 3
    @IBAction func chooseScissors() {
        //MARK: Decide who wins
        decideWinner(ItemValues.scissors)
        //MARK: Perform the segue
        performSegue(withIdentifier: "resultViewSegue_scissors", sender: self)
    }
    
    //MARK:- Prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! ResultViewController
        controller.winnerImageName = self.winnerImage
        controller.winningMessage = self.winningMsg
    }
    
    //MARK:- Function to decide the winner
    func decideWinner(_ userSelection: ItemValues){
        //MARK: Randomize the computer selection
        let computerSelection: ItemValues = generateComputerSelection(userSelection)!
        
        var userWins: Bool = true
        
        //MARK: Logic to determine who wins
        if userSelection == ItemValues.paper {
            if computerSelection == ItemValues.rock {
                winnerImage = "paper-rock"
                
            } else {
                winnerImage = "scissors-paper"
                userWins = false
            }
        } else if userSelection == ItemValues.rock {
            if computerSelection == ItemValues.paper {
                winnerImage = "paper-rock"
                userWins = false
            } else {
                winnerImage = "rock-scissors"
            }
        } else {
            if computerSelection == ItemValues.paper {
                winnerImage = "scissors-paper"
            } else {
                winnerImage = "rock-scissors"
                userWins = false
            }
        }
        
        //MARK: populate the winning message
        populateWinningMessage(winnerImage, userWins)
    }
    
    //MARK:- Function to generate computer selection
    func generateComputerSelection(_ input: ItemValues) -> ItemValues! {
        var randomOutput: Int
        repeat {
            randomOutput = Int(arc4random() % 3 + 1)
        } while input.rawValue == randomOutput
        return ItemValues(rawValue: randomOutput)
    }
    
    //MARK:- Function to identify winner message
    func populateWinningMessage(_ winnerImage: String, _ userWins: Bool) {
        
        let whoWins: String = userWins ? "You Win!" : "Computer Wins!"
        if winnerImage == "paper-rock" {
            winningMsg = "Paper wins over Rock " + whoWins
        } else if winnerImage == "rock-scissors" {
            winningMsg = "Rock wins over Scissors " + whoWins
        } else {
            winningMsg = "Scissors wins over Paper " + whoWins
        }
        
    }
    
    //MARK:- ENUM To capture the items
    enum ItemValues: Int {
        case paper = 1
        case rock
        case scissors
    }
}





