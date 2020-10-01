import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]  // Dictionary of the timers for boiling eggs
    
    @IBAction func hardnessSelected(_ sender: UIButton) {  // Define the UIButtons in the MainStoryBoard
        if let hardnessSelected = sender.currentTitle {  // Get user input button title
            if let timer = eggTimes[hardnessSelected]{  // Get the time from the dictionary
                print(timer)
            }
        }
    }
}
