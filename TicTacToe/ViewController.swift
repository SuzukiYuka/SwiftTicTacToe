//
//  ViewController.swift
//  TicTacToe
//
//  Created by nagata on 2/8/15.
//  Copyright (c) 2015 nagata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //O,Xを表示するラベル 画像でも
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
    
    //ゲーム終了してリセットするボタン
    @IBOutlet var resetBtn : UIButton!
    
    //どちらが勝ったかor引き分けか表示する
    @IBOutlet var userMsgLabel : UILabel!
    
    //KeyはO,Xの場所、valueはO,X（Oは0,Xは1）
    var plays = Dictionary<Int,Int>()
    //ゲームが終わったか
    var done = false
    //aiを動かすか
    var aiDeciding = false
    
    @IBAction func btClick(sender: UIButton) {
        userMsgLabel.hidden = true
        //押したところが空欄で、自分の番であったら、そこにXを表示する
        if plays[sender.tag] == nil && aiDeciding == false && done == false {
            setLabelForSpot(sender.tag, player:1)
        }
        //勝負がついたか判定する
        checkForWin()
        //aiのターン
        aiTurn()
    }
    
    //O,XをLabelに表示する
    func setLabelForSpot(spot:Int,player:Int) {
        //playerが1だったら"X" それ以外は"O"を表示させる
        var playerMark = player == 1 ? "X" : "O"
        plays[spot] = player
        
        //スポットの番号のlabelにX,Oを表示させる
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
    
    //リセットする
    @IBAction func resetBtClicked(sender: UIButton) {
        done = false
        userMsgLabel.hidden = true
        resetBtn.hidden = true
        reset()
    }
    
    //値を初期化する
    func reset() {
        plays = [:] //初期化
        ticTacLabel1.text = nil
        ticTacLabel2.text = nil
        ticTacLabel3.text = nil
        ticTacLabel4.text = nil
        ticTacLabel5.text = nil
        ticTacLabel6.text = nil
        ticTacLabel7.text = nil
        ticTacLabel8.text = nil
        ticTacLabel9.text = nil
        
    }
    
    //勝負がついたか判定する
    func checkForWin() {
        //だれが勝ったか
        var whoWon = ["I":0,"you":1]
        
        //I(0)の場合とYOU(1)の場合で判定する
        for(key,value) in whoWon {
            //下の行が揃ったか
            var isBottomDone = plays[7] == value && plays[8] == value && plays[9] == value
            //真ん中の行が揃ったか
            var isMiddlerowDone = plays[4] == value && plays[5] == value && plays[6] == value
            //上が揃ったか
            var isTopDone = plays[1] == value && plays[2] == value && plays[3] == value
            //左から右のななめがそろったか
            var isLeftRightDone = plays[1] == value && plays[5] == value && plays[9] == value
            //右から左のななめがそろったか
            var isRightLeftDone = plays[3] == value && plays[5] == value && plays[7] == value
            //左が揃ったか
            var isLeftDone = plays[1] == value && plays[4] == value && plays[7] == value
            //真ん中の列が揃ったか
            var isMiddleColumDone = plays[2] == value && plays[5] == value && plays[8] == value
            //右の列が揃ったか
            var isRightDone = plays[3] == value && plays[6] == value && plays[9] == value
            
            //上のどれかだったらゲーム終了
            if (isBottomDone || isMiddlerowDone || isTopDone || isLeftRightDone || isRightLeftDone || isLeftDone || isMiddleColumDone || isRightDone) {
                //ゲーム終了の処理
                userMsgLabel.hidden = false
                userMsgLabel.text = "Looks like \(key) won !"
                resetBtn.hidden = false
                done = true
            }
        }
    }
    
    
    //FindFuncs
    func checkBottom(#value:Int) -> (location:String, pattern:String)? {
        return ("bottom",checkFor(value, inList: [7,8,9]))
    }
    func checkTop(#value:Int) -> (location:String, pattern:String)? {
        return ("top",checkFor(value, inList: [1,2,3]))
    }
    func checkLeft(#value:Int) -> (location:String, pattern:String)? {
        return ("left",checkFor(value, inList: [1,4,7]))
    }
    func checkRight(#value:Int) -> (location:String, pattern:String)? {
        return ("right",checkFor(value, inList: [3,6,9]))
    }
    func checkMiddleAcross(#value:Int) -> (location:String, pattern:String)? {
        return ("middleAcross",checkFor(value, inList: [4,5,6]))
    }
    func checkMiddledown(#value:Int) -> (location:String, pattern:String)? {
        return ("middleDown",checkFor(value, inList: [2,5,8]))
    }
    func checkDiagRightLeft(#value:Int) -> (location:String, pattern:String)? {
        return ("diagRightLeft",checkFor(value, inList: [3,5,7]))
    }
    func checkDiagLeftRight(#value:Int) -> (location:String, pattern:String)? {
        return ("diagLeftRight",checkFor(value, inList: [1,5,9]))
    }
    
    func checkFor(value:Int, inList:[Int]) -> String {
        var conclusion = ""
        for cell in inList {
            if plays[cell] == value {
                conclusion += "1"
            } else {
                conclusion += "0"
                
            }
        }
        return conclusion
    }
    
    //列(行)に同じのが二つあるか
    func rowCheck(#value:Int) -> (location:String, pattern:String)? {
        var accseptableFinds = ["110","101","011"]
        var findFuncs = [checkTop,checkBottom,checkLeft,checkRight,checkMiddleAcross,checkMiddledown,checkDiagLeftRight,checkDiagRightLeft]
        for algorthm in findFuncs {
            var algorthmResults = algorthm(value:value)
            if (find(accseptableFinds,algorthmResults!.pattern) != nil) {
                return algorthm(value:0)
            }
        }
        return nil
    }
    
    func isOccupied(spot:Int) -> Bool {
        return plays[spot] != nil
    }
    
    //AIの動き
    func aiTurn() {
        //ゲームが終わっていたらなにもしない
        if done {
            return
        }
        //AI計算中はtrueにする
        aiDeciding = true
        
        
        if let result = rowCheck(value:0) {
            var whereToPlayResult = whereToPlay(result.location, pattern:result.pattern)
            if !isOccupied(whereToPlayResult) {
                setLabelForSpot(whereToPlayResult, player: 0)
                aiDeciding = false
                checkForWin()
                return
            }
        }
        if let result = rowCheck(value:1) {
            var whereToPlayResult = whereToPlay(result.location, pattern:result.pattern)
            if !isOccupied(whereToPlayResult) {
                setLabelForSpot(whereToPlayResult, player: 0)
                aiDeciding = false
                checkForWin()
                return
            }
        }
        
        if !isOccupied(5) {
            setLabelForSpot(5, player: 0)
            aiDeciding = false
            checkForWin()
            return
        }
        
        func firstAvailable(#isCorner:Bool) -> Int? {
            var spots = isCorner ? [1,3,7,9] : [2,4,6,8]
            for spot in spots {
                if !isOccupied(spot) {
                    return spot
                }
            }
            return nil
        }
        
        
        if let cornerAvailable = firstAvailable(isCorner: true) {
            setLabelForSpot(cornerAvailable, player: 0)
            aiDeciding = false
            checkForWin()
            return
        }
        
        if let sideAvailable = firstAvailable(isCorner: false) {
            setLabelForSpot(sideAvailable, player: 0)
            aiDeciding = false
            checkForWin()
            return
        }
        userMsgLabel.hidden = false
        userMsgLabel.text = "Looks like it was a tie!"
        
        reset()
        
        aiDeciding = false
        
    }
    
    //どこにおくか
    func whereToPlay(location:String, pattern:String) -> Int {
        var leftPattern = "011"
        var rightPattern = "110"
        var middlePattern = "101"
        
        switch location {
        case "top":
            if pattern == leftPattern {
                return 1
            }else if pattern == rightPattern {
                return 3
            }else {
                return 2
            }
        case "bottom":
            if pattern == leftPattern {
                return 7
            }else if pattern == rightPattern {
                return 9
            }else {
                return 8
            }
        case "left":
            if pattern == leftPattern {
                return 1
            }else if pattern == rightPattern {
                return 7
            }else {
                return 4
            }
        case "right":
            if pattern == leftPattern {
                return 3
            }else if pattern == rightPattern {
                return 9
            }else {
                return 6
            }
        case "middleAcross":
            if pattern == leftPattern {
                return 4
            }else if pattern == rightPattern {
                return 6
            }else {
                return 5
            }
        case "middleDown":
            if pattern == leftPattern {
                return 2
            }else if pattern == rightPattern {
                return 8
            }else {
                return 5
            }
        case "diagLeftRight":
            if pattern == leftPattern {
                return 1
            }else if pattern == rightPattern {
                return 9
            }else {
                return 5
            }
        case "diagRightLeft":
            if pattern == leftPattern {
                return 3
            }else if pattern == rightPattern {
                return 7
            }else {
                return 5
            }
        default: return 4
        }
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

