//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Bojie Jiang on 8/1/15.
//  Copyright © 2015 Bojie Jiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 1 = noughts, 2 = crosses
    
    var activePlayer = 1
    
    var gameActive = true
    
    var gameState = [0,0,0,0,0,0,0,0,0]
    
    var winningCombinations = [[0,1,2], [3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    var counter = 0
    
    @IBOutlet weak var playAgainBtn: UIButton!
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var gameOverLabel: UILabel!
    
    @IBAction func playAgainPressed(sender: AnyObject) {
        
        resetGameForTie()
        
        gameOverLabel.hidden = true
        playAgainBtn.hidden = true
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 400, gameOverLabel.center.y)
        playAgainBtn.center = CGPointMake(playAgainBtn.center.x - 400, playAgainBtn.center.y)
        
        
    }
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if gameState[sender.tag] == 0 && gameActive == true {
            
            var image = UIImage()
            
            gameState[sender.tag] = activePlayer
            
            
            
            if activePlayer == 1 {
                image = UIImage(named: "nought.png")!
                activePlayer = 2
            } else {
                image = UIImage(named: "cross.png")!
                activePlayer = 1
            }
            
            
            sender.setImage(image, forState: .Normal)
            
            for combination in winningCombinations {
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    
                    var labelText = "Noughts Has Won!"
                    
                    if gameState[combination[0]] == 2 {
                        
                        labelText =  "Crosses Has Won!"
                    }
                    
                    gameOverLabel.text = labelText
                    
                    gameOverLabel.hidden = false
                    playAgainBtn.hidden = false
                    
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 400, self.gameOverLabel.center.y)
                        self.playAgainBtn.center = CGPointMake(self.playAgainBtn.center.x + 400, self.playAgainBtn.center.y)
                    })
                    
                    gameActive = false
                    counter = -1
                }
                
            }
            
            counter++
            
            if counter == 9 {
                resetGameForTie()
                counter = 0
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        gameOverLabel.hidden = true
        playAgainBtn.hidden = true
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 400, gameOverLabel.center.y)
        playAgainBtn.center = CGPointMake(playAgainBtn.center.x - 400, playAgainBtn.center.y)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
    }
    
    func resetGameForTie() {
        
        activePlayer = 1
        
        gameActive = true
        
        gameState = [0,0,0,0,0,0,0,0,0]
        
        var button = UIButton()
        
        for var i = 0; i < 9; i++ {
            button  = view.viewWithTag(i) as! UIButton
            button.setImage(nil, forState: .Normal)
        }
        
    }
    
    
}

