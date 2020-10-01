import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]  // Dictionary of the timers for boiling eggs
    var timer = Timer()
    var player : AVAudioPlayer?
    
    @IBAction func hardnessSelected(_ sender: UIButton) {  // Define the UIButtons in the MainStoryBoard
        titleLabel.text = "How do you like your eggs?"
        progressBar.progress = 0
        timer.invalidate()
        if let hardnessSelected = sender.currentTitle {  // Get user input button title
            if let eggTimer = eggTimes[hardnessSelected]{  // Get the time from the dictionary
                let totalSeconds = eggTimer * 60  // Convert minutes to seconds
                var secondsRemaining = totalSeconds
                self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in  // Create a timer with seconds and repeat every 1 second
                    if secondsRemaining > 0 {
                        secondsRemaining -= 1
                        self.progressBar.progress = (1 - (Float(secondsRemaining) / Float(totalSeconds)))
                    } else {
                        self.titleLabel.text = "Done!!"
                        self.progressBar.progress = 1
                        self.playSound()  // Run the sound function when the timer is done
                        Timer.invalidate()
                    }
                }
            }
        }
    }
    
    // MARK: Add the sound function
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)  // To make it run sound in silent mode
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = player else { return }
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
