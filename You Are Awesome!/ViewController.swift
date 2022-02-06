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
    
    var imageNumber = -1
    var messageNumber = -1
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = ""
    }

    @IBAction func messageButtonPressed(_ sender: Any) {
        let messages = ["You Are Awesome!",
                        "You Are Great!",
                        "When the Genius Bar Needs Help, They Call You!",
                        "You Are Fantastic!",
                        "Fabulous? That's You!", "You've Got The Design Skills of Jony Ive"]
        
        var newMessageNumber: Int
        repeat {
            print("Repeating Value")
            newMessageNumber = Int.random(in:0...messages.count-1)
//        messageLabel.text =  messages[Int.random(in:0...messages.count-1)]
        } while messageNumber == newMessageNumber
        messageNumber = newMessageNumber
        messageLabel.text = messages[messageNumber]
    
        var newImageNumber: Int
        repeat {
            newImageNumber = Int.random(in:0...9)
        } while imageNumber == newImageNumber
        imageNumber = newImageNumber
        imageView.image = UIImage(named: "image\(imageNumber)")
        
        if let sound = NSDataAsset(name: "sound0") {
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
    
}
