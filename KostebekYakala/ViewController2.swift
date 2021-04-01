//
//  ViewController2.swift
//  Köstebek Yakala
//
//  Created by Tolga Kağan Aysu on 19.02.2021.
//

import UIKit

class ViewController2: UIViewController {

    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    var score: Int = 0
    var timer = Timer()
    var timerMove = Timer()
    var time = 0              //Oyun süresi
    var replayTime = 0       // Oyun tekrarında başlangıç zamanı tutmak için
    var random = 0
    var randomControl = 0
    
    //Import View
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var imageView5: UIImageView!
    @IBOutlet weak var imageView6: UIImageView!
    @IBOutlet weak var imageView7: UIImageView!
    @IBOutlet weak var imageView8: UIImageView!
    @IBOutlet weak var imageView9: UIImageView!
    @IBOutlet weak var imageView10: UIImageView!
    @IBOutlet weak var imageView11: UIImageView!
    @IBOutlet weak var imageView12: UIImageView!
    @IBOutlet weak var imageView13: UIImageView!
    @IBOutlet weak var imageView14: UIImageView!
    @IBOutlet weak var imageView15: UIImageView!
    @IBOutlet weak var imageView16: UIImageView!
    @IBOutlet weak var imageView17: UIImageView!
    @IBOutlet weak var imageView18: UIImageView!
    @IBOutlet weak var imageView19: UIImageView!
    @IBOutlet weak var imageView20: UIImageView!
    
    
    var imageViewArray = [UIImageView]()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        replayTime = self.time
        timeLabel.text = "\(time)"
        scoreLabel.text = "Score: \(score)"
        viewEnabled()
        hideIW()
        
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        timerMove = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(moveIt), userInfo: nil, repeats: true)
            
            
    }
    
  
    
    @objc func countDown(){
        
        time += -1
        timeLabel.text = "\(time)"
        
        if time == 0 {
            timer.invalidate()
            gameOver()
        }
    }
   
   
    @objc func gameOver(){
        //Geri sayım bitince çağırılacak fonksiyon
        //Alert
        //yes-no fonksiyonları
        
     
        
        
        
        
        
        let alert = UIAlertController(title: "Game Over", message: "Do you play again", preferredStyle: UIAlertController.Style.alert)
       
        let yesButtonAllert = UIAlertAction(title: "YES", style: UIAlertAction.Style.default) { (UIAlertAction) in
          
            self.score = 0
            self.time = self.replayTime
            self.hideIW()
            self.moveIt()
            self.timeLabel.text = "\(self.time)"
            self.scoreLabel.text = "Score: \(self.score)"
         
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
            self.timerMove = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.moveIt), userInfo: nil, repeats: true)
        }
        alert.addAction(yesButtonAllert)
        
        let noButtonAllert = UIAlertAction(title: "No", style: UIAlertAction.Style.cancel) { (UIAlertAction) in
            
           
            
            
            
            
            
            
        }
        alert.addAction(noButtonAllert)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func increaseScore(){
        // Fotoğraflara tıklandığında aktif olan foksiyon
        // Her tıklandığında scoru 1 arttır
        
        score += 1
        scoreLabel.text = "Score : \(score)"
    }
    
    
  
    func hideIW(){
        //ImageView ları gizle
        
    
        
        for hide in imageViewArray {
            hide.isHidden = true
        }
    }
    
    
    
    @objc func moveIt(){
        //Tüm imageları gizle
        //0 ile arrayin boyutu arasında random sayılar oluştur
        //Arka arkaya aynı random sayıların gelmesini önle
       //Süre bitince timerı kapat
        
        hideIW()
        random = Int(arc4random_uniform(UInt32(imageViewArray.count-1)))
        
     
        if random == randomControl {
           random = Int(arc4random_uniform(UInt32(imageViewArray.count-1)))
            
        }
        imageViewArray[random].isHidden = false
        randomControl = random
        
        if time == 0 {
            timerMove.invalidate()
            hideIW()
            gameOver()
        }
        
    }

    func viewEnabled(){
        
        imageViewArray = [imageView1,imageView2,imageView3,imageView4,imageView5,imageView6,imageView7,
                          imageView8,imageView9,imageView10,imageView11,imageView12,imageView13,
                          imageView14,imageView15,imageView16,imageView17,imageView18,imageView19,imageView20]
        
        
        imageView1.isUserInteractionEnabled = true
        imageView2.isUserInteractionEnabled = true
        imageView3.isUserInteractionEnabled = true
        imageView4.isUserInteractionEnabled = true
        imageView5.isUserInteractionEnabled = true
        imageView6.isUserInteractionEnabled = true
        imageView7.isUserInteractionEnabled = true
        imageView8.isUserInteractionEnabled = true
        imageView9.isUserInteractionEnabled = true
        imageView10.isUserInteractionEnabled = true
        imageView11.isUserInteractionEnabled = true
        imageView12.isUserInteractionEnabled = true
        imageView13.isUserInteractionEnabled = true
        imageView14.isUserInteractionEnabled = true
        imageView15.isUserInteractionEnabled = true
        imageView16.isUserInteractionEnabled = true
        imageView17.isUserInteractionEnabled = true
        imageView18.isUserInteractionEnabled = true
        imageView19.isUserInteractionEnabled = true
        imageView20.isUserInteractionEnabled = true

        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer10 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer11 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer12 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer13 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer14 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer15 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer16 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer17 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer18 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer19 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer20 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        imageView1.addGestureRecognizer(recognizer1)
        imageView2.addGestureRecognizer(recognizer2)
        imageView3.addGestureRecognizer(recognizer3)
        imageView4.addGestureRecognizer(recognizer4)
        imageView5.addGestureRecognizer(recognizer5)
        imageView6.addGestureRecognizer(recognizer6)
        imageView7.addGestureRecognizer(recognizer7)
        imageView8.addGestureRecognizer(recognizer8)
        imageView9.addGestureRecognizer(recognizer9)
        imageView10.addGestureRecognizer(recognizer10)
        imageView11.addGestureRecognizer(recognizer11)
        imageView12.addGestureRecognizer(recognizer12)
        imageView13.addGestureRecognizer(recognizer13)
        imageView14.addGestureRecognizer(recognizer14)
        imageView15.addGestureRecognizer(recognizer15)
        imageView16.addGestureRecognizer(recognizer16)
        imageView17.addGestureRecognizer(recognizer17)
        imageView18.addGestureRecognizer(recognizer18)
        imageView19.addGestureRecognizer(recognizer19)
        imageView20.addGestureRecognizer(recognizer20)
    }
    
    
    
  
}
