//
//  ViewController.swift
//  TicTacToe
//
//  Created by nagata on 2/8/15.
//  Copyright (c) 2015 nagata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var ticTacLabel1 : UILabel!
    @IBOutlet var ticTacLabel2 : UILabel!
    @IBOutlet var ticTacLabel3 : UILabel!
    @IBOutlet var ticTacLabel4 : UILabel!
    @IBOutlet var ticTacLabel5 : UILabel!
    @IBOutlet var ticTacLabel6 : UILabel!
    @IBOutlet var ticTacLabel7 : UILabel!
    @IBOutlet var ticTacLabel8 : UILabel!
    @IBOutlet var ticTacLabel9 : UILabel!
    
    @IBOutlet var ticTacBtn1 : UIButton!
    @IBOutlet var ticTacBtn2 : UIButton!
    @IBOutlet var ticTacBtn3 : UIButton!
    @IBOutlet var ticTacBtn4 : UIButton!
    @IBOutlet var ticTacBtn5 : UIButton!
    @IBOutlet var ticTacBtn6 : UIButton!
    @IBOutlet var ticTacBtn7 : UIButton!
    @IBOutlet var ticTacBtn8 : UIButton!
    @IBOutlet var ticTacBtn9 : UIButton!
    
    @IBOutlet var resetBtn : UIButton!
    
    @IBOutlet var userMsgLabel : UILabel!
    
    var plays = Dictionary<Int,Int>()
    var done = false
    var aiDeciding = false
    
    @IBAction func btClick(sender: UIButton) {
        userMsgLabel.hidden = true
        if plays[sender.tag] == nil && aiDeciding == false && done == false {
            setLabelForSpot(sender.tag, player:1)
        }
        checkForWin()
        aiTurn()
    }
    
    func setLabelForSpot(spot:Int,player:Int) {
        var playerMark = player == 1 ? "X" : "O"
        plays[spot] = player
        
        switch spot {
        case 1:
            ticTacLabel1.text = playerMark
        case 2:
            ticTacLabel2.text = playerMark
        case 3:
            ticTacLabel3.text = playerMark
        case 4:
            ticTacLabel4.text = playerMark
        case 5:
            ticTacLabel5.text = playerMark
        case 6:
            ticTacLabel6.text = playerMark
        case 7:
            ticTacLabel7.text = playerMark
        case 8:
            ticTacLabel8.text = playerMark
        case 9:
            ticTacLabel9.text = playerMark
        default :
            ticTacLabel5.text = playerMark
            
        }
    }
    
    func checkForWin() {
        var whoWon = ["I":0,"you":1]
        for(key,value) in whoWon {
            
        }
        
    }
    
    func aiTurn() {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

