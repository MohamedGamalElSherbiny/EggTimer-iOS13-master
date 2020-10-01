import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 5]  // Dictionary of the timers for boiling eggs
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {  // Define the UIButtons in the MainStoryBoard
        titleLabel.text = "How do you like your eggs?"
        timer.invalidate()
        if let hardnessSelected = sender.currentTitle {  // Get user input button title
            if let eggTimer = eggTimes[hardnessSelected]{  // Get the time from the dictionary
                var secondsRemaining = eggTimer  // Convert minutes to seconds
                self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in  // Create a timer with seconds and repeat every 1 second
                    if secondsRemaining > 0 {
                        print ("\(secondsRemaining) seconds")
                        secondsRemaining -= 1
                    } else {
                        self.titleLabel.text = "Done!!"
                        Timer.invalidate()
                    }
                }
            }
        }
    }
}
