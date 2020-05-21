//
//  ViewController.swift
//  BullsEye2
//
//  Created by Bruna Fernanda Drago on 13/04/20.
//  Copyright © 2020 Bruna Fernanda Drago. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue : Int = 0
    var targetValue  : Int = 0
    var score        : Int = 0
    var round        : Int = 0
    
    @IBOutlet weak var slider           : UISlider!
    @IBOutlet weak var targetLabel      : UILabel!
    @IBOutlet weak var titleLabel       : UILabel!
    @IBOutlet weak var num1Label        : UILabel!
    @IBOutlet weak var num100Label      : UILabel!
    @IBOutlet weak var scoreLabel       : UILabel!
    @IBOutlet weak var roundLabel       : UILabel!
    @IBOutlet weak var scoreResultLabel : UILabel!
    @IBOutlet weak var roundResultLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewGame()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftImageResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftImageResizable, for: .normal)
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightImageResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage (trackRightImageResizable, for: .normal)
        
        
    }

    @IBAction func showAlert (){
        
        var difference : Int
        //abs serve p tornar os numeros absolutos e positivos
        difference = abs(currentValue - targetValue)
        // da para calcular com IF ou de outras formas
            /* if currentValue > targetValue{
                 difference = currentValue - targetValue
             } else if targetValue > currentValue{
                 difference = targetValue - currentValue
             } else {
                 difference = 0
             }*/
        var points = 100 - difference
        score += points
        let title : String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "Good job!"
            if difference == 1{
                points += 50
            }
        }else if difference < 10{
            title = "You almost done"
        } else{
            title = "Try again!"
        }
        
     
        
            let msg = "You scored \(points)."
            let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK!", style: .default, handler: {
            action in
            self.startNewRound()
        })
            
            
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    @IBAction func sliderMoved(_slider:UISlider){
        let roundedValue = _slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    @IBAction func startOver (){
        startNewGame()
}
    @IBAction func info(){
        
    }

    func startNewRound(){
        round = round + 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updatedLabels()
    }
    func updatedLabels(){
        targetLabel.text = String(targetValue)
        scoreResultLabel.text = String(score)
        roundResultLabel.text = String(round)
    }
    func startNewGame(){
       score = 0
       round = 0
       startNewRound()
      
    }
}
