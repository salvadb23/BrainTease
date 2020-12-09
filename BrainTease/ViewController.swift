//
//  ViewController.swift
//  BrainTease
//
//  Created by Salvador Becerra on 12/7/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    
    @IBOutlet weak var retryButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    
    @IBOutlet weak var score: UILabel!
    
    let textToColor = [
        "Blue": UIColor.blue,
        "Yellow": UIColor.yellow,
        "Red": UIColor.red,
        "Magenta": UIColor.magenta,
        "Purple": UIColor.purple,
        "Cyan": UIColor.cyan,
        "Brown": UIColor.brown,
        "Green": UIColor.green,
    ]
    
    
    @IBAction func retry(_ sender: UIButton) {
        self.noButton.isEnabled = true
        self.yesButton.isEnabled = true
        retryButton.isHidden = true
        createtimer()
        game()
    }
    
    @IBAction func yesButton(_ sender: UIButton) {
        let currScore = Int(score.text!)
        if textToColor[topLabel.text!] == bottomLabel.textColor {
            score.text = String(currScore! + 10)
        } else {
            score.text = String(currScore! - 10)
        }
        game()
        
    }
    
    @IBAction func noButton(_ sender: UIButton) {
        let currScore = Int(score.text!)
        if textToColor[topLabel.text!] !== bottomLabel.textColor {
            score.text = String(currScore! + 10)
        } else {
            score.text = String(currScore! - 10)
        }
        game()
    }
    
    func createtimer(){
        var runCount = 0
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ timer in
            print("Timer fired")
            runCount += 1
            self.timerLabel.text = "TIME LEFT: \(60 - runCount)"
            if runCount == 60 {
                timer.invalidate()
                self.retryButton.isHidden = false
                self.noButton.isEnabled = false
                self.yesButton.isEnabled = false
            }
        }
    }
    
    func random(num: UInt32) -> Any {
        if num == 0 {
            return UIColor.red
        }; if num == 1 {
            return UIColor.blue
        }; if num == 2 {
            return UIColor.yellow
        }; if num == 3 {
            return UIColor.purple
        }; if num == 4 {
            return UIColor.green
        } else {
            return UIColor.black
        }
    }
    
    func game(){
        
        let colors = ["Blue", "Yellow", "Red", "Purple", "Green"]
        let randomIntTop = arc4random_uniform(5)
        print(randomIntTop)
        let randomIntBottom = arc4random_uniform(5)
        topLabel.text = colors[Int(randomIntTop)]
        bottomLabel.text = colors[Int(randomIntBottom)]
        let randomNum = arc4random_uniform(5)
        bottomLabel.textColor = random(num: randomNum) as? UIColor
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        retryButton.isHidden = true
        createtimer()
        game()
    }


}

