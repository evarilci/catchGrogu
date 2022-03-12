//
//  ViewController.swift
//  Catch Grogu
//
//  Created by Eymen Varilci on 13.02.2022.
//

import UIKit

class ViewController: UIViewController {

    var grogu1 = UIImageView()
    var grogu2 = UIImageView()
    var grogu3 = UIImageView()
    var grogu4 = UIImageView()
    var grogu5 = UIImageView()
    var grogu6 = UIImageView()
    var grogu7 = UIImageView()
    var grogu8 = UIImageView()
    var grogu9 = UIImageView()
    var timeLabel = UILabel()
    var scoreLabel = UILabel()
    var highscoreLabel = UILabel()
    var timer = Timer()
    var hideTimer = Timer()
    var score = 0
    var highscore = 0
    var counter = 0
    var groguArray = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let storedHighscore = UserDefaults.standard.object(forKey: "highscore")
        
        if storedHighscore == nil {
            
            highscore = 0
            highscoreLabel.text = "Highscore: \(highscore)"
        }
        if let newScore = storedHighscore as? Int {
            
            highscore = newScore
            highscoreLabel.text = "Highscore: \(highscore)"
            
        }
        
        counter = 10

        let width = view.frame.size.width
        let height = view.frame.size.height
        
        
        // Images
        grogu1.image = UIImage(named: "grogu")
        grogu1.frame = CGRect(x: width * 0.20 - 100/2, y: height * 0.3 - 100/2, width: 100, height: 100)
        view.addSubview(grogu1)
        grogu2.image = UIImage(named: "grogu")
        grogu2.frame = CGRect(x: width * 0.50 - 100/2, y: height * 0.3 - 100/2, width: 100, height: 100)
        view.addSubview(grogu2)
        grogu3.image = UIImage(named: "grogu")
        grogu3.frame = CGRect(x: width * 0.80 - 100/2, y: height * 0.3 - 100/2, width: 100, height: 100)
        view.addSubview(grogu3)
        grogu4.image = UIImage(named: "grogu")
        grogu4.frame = CGRect(x: width * 0.20 - 100/2, y: height * 0.50 - 100/2, width: 100, height: 100)
        view.addSubview(grogu4)
        grogu5.image = UIImage(named: "grogu")
        grogu5.frame = CGRect(x: width * 0.50 - 100/2, y: height * 0.50 - 100/2, width: 100, height: 100)
        view.addSubview(grogu5)
        grogu6.image = UIImage(named: "grogu")
        grogu6.frame = CGRect(x: width * 0.80 - 100/2, y: height * 0.50 - 100/2, width: 100, height: 100)
        view.addSubview(grogu6)
        grogu7.image = UIImage(named: "grogu")
        grogu7.frame = CGRect(x: width * 0.20 - 100/2, y: height * 0.70 - 100/2, width: 100, height: 100)
        view.addSubview(grogu7)
        grogu8.image = UIImage(named: "grogu")
        grogu8.frame = CGRect(x: width * 0.50 - 100/2, y: height * 0.70 - 100/2, width: 100, height: 100)
        view.addSubview(grogu8)
        grogu9.image = UIImage(named: "grogu")
        grogu9.frame = CGRect(x: width * 0.80 - 100/2, y: height * 0.70 - 100/2, width: 100, height: 100)
        view.addSubview(grogu9)

        grogu1.isUserInteractionEnabled = true
        grogu2.isUserInteractionEnabled = true
        grogu3.isUserInteractionEnabled = true
        grogu4.isUserInteractionEnabled = true
        grogu5.isUserInteractionEnabled = true
        grogu6.isUserInteractionEnabled = true
        grogu7.isUserInteractionEnabled = true
        grogu8.isUserInteractionEnabled = true
        grogu9.isUserInteractionEnabled = true

        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        grogu1.addGestureRecognizer(recognizer1)
        grogu2.addGestureRecognizer(recognizer2)
        grogu3.addGestureRecognizer(recognizer3)
        grogu4.addGestureRecognizer(recognizer4)
        grogu5.addGestureRecognizer(recognizer5)
        grogu6.addGestureRecognizer(recognizer6)
        grogu7.addGestureRecognizer(recognizer7)
        grogu8.addGestureRecognizer(recognizer8)
        grogu9.addGestureRecognizer(recognizer9)

        groguArray = [grogu1,grogu2,grogu3,grogu4,grogu5,grogu6,grogu7,grogu8,grogu9]
        
        // score label
        
        scoreLabel.text = "Score: \(score)"
        scoreLabel.textAlignment = .center
        scoreLabel.textColor = UIColor.white
        scoreLabel.font = UIFont(name: "Helvetica", size: 25)
        scoreLabel.frame = CGRect(x: width * 0.5 - 150/2, y: height * 0.18 - 40/2, width: 150, height: 40)
        view.addSubview(scoreLabel)
        
        // time label
        timeLabel.text =  "\(counter)"
        timeLabel.textAlignment = .center
        timeLabel.textColor = UIColor.red
        timeLabel.font = UIFont(name: "Helvetica", size: 50)
        timeLabel.frame = CGRect(x: width * 0.5 - 100/2, y: height * 0.10 - 40/2, width: 100, height: 40)
        view.addSubview(timeLabel)
        
        // highscore Label
        highscoreLabel.textAlignment = .center
        highscoreLabel.textColor = UIColor.white
        highscoreLabel.font = UIFont(name: "HelveticaNeue", size: 25)
        highscoreLabel.frame = CGRect(x: width * 0.50 - 300/2, y: height * 0.90 - 40/2, width: 300, height: 40)
        view.addSubview(highscoreLabel)
        
        // timer
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCount), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideGrogu), userInfo: nil, repeats: true)
   
    hideGrogu()
    }

    
    @objc func increaseScore() {
        
        score += 1
        scoreLabel.text = "Score: \(score)"
        
    }
    @objc func timerCount() {
        
        counter -= 1
        timeLabel.text = "\(counter)"
        
        if counter == 0 {
            if self.score > self.highscore {
                
                self.highscore = self.score
                self.highscoreLabel.text = "Highscore: \(self.highscore)"
                UserDefaults.standard.set(highscore, forKey: "highscore")
            }
        let alert = UIAlertController(title: "Uyarı!", message: "Zaman doldu", preferredStyle: UIAlertController.Style.alert)
        let passOk = UIAlertAction.init(title: "Tamam", style: UIAlertAction.Style.cancel, handler: nil)
        let passRetry = UIAlertAction.init(title: "Tekrar dene", style: UIAlertAction.Style.default) { UIAlertAction in
            self.score = 0
            self.scoreLabel.text = "Score: \(self.score)"
            self.counter = 10
            self.timeLabel.text = "\(self.counter)"
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerCount), userInfo: nil, repeats: true)
            self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideGrogu), userInfo: nil, repeats: true)
        }
                
                alert.addAction(passOk)
                alert.addAction(passRetry)
                self.present(alert, animated: true, completion: nil)
               
                timer.invalidate()
            hideTimer.invalidate()
}
    
    }
        
    
    @objc func hideGrogu(){
        
        for grogu in groguArray {
            
            grogu.isHidden = true
}
        let random = Int(arc4random_uniform(UInt32(groguArray.count - 1)))
        groguArray[random].isHidden = false
    }
    
    
    
    
}
    

// end
