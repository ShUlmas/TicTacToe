//  ViewController.swift
//  TicTacToe
//  Created by O'lmasbek on 07/10/22.

import UIKit

class ViewController: UIViewController {
    //    ----------------------------------   OUTLETS   -------------
    
    @IBOutlet weak var turnLbl: UILabel!
    @IBOutlet var buttons: [UIButton]!
    
    //   ----------------------------------    VARIABLES   ----------------
    
    var correctTags = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var xAnswers = [Int]()
    var oAnswers = [Int]()
    var isXturn = true
    var isGameEnded = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
//----------------------------    BUTTONLANI BOSILISHI  ----------------------------
    
    @IBAction func btnsPressed(_ sender: UIButton) {
        if isXturn == true {
            buttons[sender.tag].setTitle("X", for: .normal)
            isXturn = false
            xAnswers.append(sender.tag)
            sender.isEnabled = false
            turnLbl.text = "Turn: O"
            
            for i in correctTags {
                if Set(i).isSubset(of: xAnswers){
                    turnLbl.text = "X win"
                    turnLbl.textColor = .systemGreen
                    buttons.forEach { btn in btn.isEnabled = false}
                }
            }
            isGameEndedd()
        } else {
            buttons[sender.tag].setTitle("O", for: .normal)
            isXturn = true
            oAnswers.append(sender.tag)
            sender.isEnabled = false
            turnLbl.text = "Turn: X"
            
            for i in correctTags {
                if Set(i).isSubset(of: oAnswers){
                    turnLbl.text = "O win"
                    turnLbl.textColor = .systemGreen
                    buttons.forEach { btn in btn.isEnabled = false}
                }
            }
            isGameEndedd()
        }
    }
    //---------------------------------   RESTART PRESSED    --------------------------
    
    @IBAction func restartPressed(_ sender: Any) {
        xAnswers = []
        oAnswers = []
        turnLbl.text = "Turn: X"
        turnLbl.textColor = .black
        buttons.forEach {
            btn in btn.setTitle("", for: .normal)
            btn.isEnabled = true
        }
    }
    //-----------------------------   DROW FUNCTION   ----------------------------
    
    func isGameEndedd(){
        let count = xAnswers.count + oAnswers.count
        if count > 8 && isGameEnded == false {
            turnLbl.text = "Drow"
            turnLbl.textColor = .systemPink
        }
    }
}

