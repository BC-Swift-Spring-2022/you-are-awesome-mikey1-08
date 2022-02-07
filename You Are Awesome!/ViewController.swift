//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Michael Li on 1/22/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    let awesomeMessage = "You Are Russian!"
    let greatMessage = "You Are Great!"
    let bombMessage = "You Are Da Bomb!"
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var playSoundSwitch: UISwitch!
    
    var imageNumber = -1
    var messageNumber = -1
    var soundNumber = -1
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = ""
    }

    func playSound (name: String ) {
        if let sound = NSDataAsset(name: name) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            }   catch {
                print("ERROR: Could not initialize AVAudioPlayer")
            }
        } else {
            print("ERROR: Could not read data from file sound 0")
        }
        
    }
    
    func nonRepeatingRandom (originalNumber: Int, upperLimit: Int) -> Int {
        var newNumber: Int
        repeat {
            print("Repeating Value")
            newNumber = Int.random(in:0...upperLimit-1)
//        messageLabel.text =  messages[Int.random(in:0...messages.count-1)]
        } while originalNumber == newNumber
        return newNumber
    }
    
    @IBAction func messageButtonPressed(_ sender: UIButton) {
        let messages = ["You Are Awesome!",
                        "You Are Great!",
                        "When the Genius Bar Needs Help, They Call You!",
                        "You Are Fantastic!",
                        "Fabulous? That's You!", "You've Got The Design Skills of Jony Ive"]
        
        messageNumber = nonRepeatingRandom(originalNumber: messageNumber, upperLimit: messages.count-1)
        
        messageLabel.text = messages[messageNumber]
    
        imageNumber = nonRepeatingRandom(originalNumber: imageNumber, upperLimit: 9)
        imageView.image = UIImage(named: "image\(imageNumber)")
        
        soundNumber = nonRepeatingRandom(originalNumber: soundNumber, upperLimit: 5)
        print("The New sound Number is \(soundNumber)")
        
        if playSoundSwitch.isOn {
            playSound(name: "sound\(soundNumber)")
        }
    }
    
    @IBAction func playSoundToggled(_ sender: UISwitch) {
        if !sender.isOn && audioPlayer != nil { //if is.On is NOT true
            audioPlayer.stop() // stop playing
            
        }
    }
}
