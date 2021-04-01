
import UIKit

class ViewController: UIViewController {
    var time:Int = 5
  
    
    @IBAction func timefive(_ sender: Any) {
        time = 5
        timeLabel.text = "Time: \(time)"
    }
    
    
    @IBAction func timeten(_ sender: Any) {
        time = 10
        timeLabel.text = "Time: \(time)"
    }
    
    @IBAction func timefifteen(_ sender: Any) {
        time = 20
        timeLabel.text = "Time: \(time)"
    }
    
    @IBOutlet weak var timeLabel: UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = "Time: \(time)"
    
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //View controller arası veri alımı
       //Seçilen süreyi oyuna aktar
        if segue.identifier == "startGame" {
            let destination = segue.destination as! ViewController2
            destination.time = self.time
    
        }
        
    }
    


}

