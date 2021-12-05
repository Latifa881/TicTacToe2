//
//  ViewController.swift
//  TicTacToe2
//
//  Created by administrator on 05/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet weak var winnerLabel: UILabel!
    var activePlayer = 1 // 1 for red , 2 for blue
    var gameState = [ 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0]
    let winningCombinantions = [[0,1,2], [3,4,5] , [6,7,8] , [0,3,6], [1,4,7] , [2,5,8], [0,4,8], [2,4,6]]
    var gameIsActive = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        winnerLabel.text = "Red's Turn"
    }
    
    @IBAction func buttonPresed(_ sender: UIButton) {
        // if the button is is not selected before and the game is active
        if (gameState[sender.tag-1] == 0 && gameIsActive == true){
            gameState[sender.tag-1] = activePlayer
            
            if (activePlayer == 1 ) {
                sender.backgroundColor = .red
                activePlayer = 2
                winnerLabel.text = "Blue's Turn"
                
            }else {
                
                sender.backgroundColor = .blue
                activePlayer = 1
                winnerLabel.text = "Red's Turn"
            }
        }
      winnerState()
    }

    func winnerState(){
       
        for combinantion in winningCombinantions {
            if gameState[combinantion[0]] != 0 &&  gameState[combinantion[0]] ==  gameState[combinantion[1]] && gameState[combinantion[1]] ==  gameState[combinantion[2]]{
                gameIsActive = false
                
                if gameState[combinantion[0]] == 1 {
                    winnerLabel.isHidden = false
                    winnerLabel.text = "Congrats Red Won"
                    winnerLabel.textColor = .red
                } else if gameState[combinantion[0]] == 2{
                    winnerLabel.isHidden = false
                    winnerLabel.text = "Congrats Blue Won"
                    winnerLabel.textColor = .blue
                }
              
            }
        }
        if !gameState.contains(0){
           winnerLabel.isHidden = false
           winnerLabel.text = "The game has ended with a tie"
            winnerLabel.textColor = .green
       }
    }


@IBAction func resetButton(_ sender: Any) {
    winnerLabel.text = "Red's Turn"
    winnerLabel.textColor = .black
    gameIsActive = true
    activePlayer = 1
    gameState = [ 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0]
    
    for index in 0..<buttons.count {
        buttons[index].tag = index+1
        buttons[index].backgroundColor = .systemGray5
    
    }
    
}
    
}

