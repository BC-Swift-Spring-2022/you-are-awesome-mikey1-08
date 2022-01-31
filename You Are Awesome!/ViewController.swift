//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Michael Li on 1/22/22.
//

import UIKit

class ViewController: UIViewController {

    let awesomeMessage = "You Are Russian!"
    let greatMessage = "You Are Great!"
    let bombMessage = "You Are Da Bomb!"
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var imageNumber = 0
    var messageNumber = 0
    
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
        
        messageLabel.text =  messages[Int.random(in:0...messages.count-1)]
        imageView.image = UIImage(named: "image\(Int.random(in:0...9))")
        
//        messageLabel.text = messages[messageNumber]
//        messageNumber += 1
//        if messageNumber == messages.count {messageNumber=0}
//        let imageName = "image" + String(imageNumber)
//        let imageName = "image\(imageNumber)"
//        imageView.image = UIImage(named: imageName)
//        imageNumber = imageNumber + 1
//        if imageNumber == 10 {imageNumber = 0}
//
//        if messageLabel.text == awesomeMessage {
//            messageLabel.text = greatMessage
//            imageView.image = UIImage(named: "image1")
//        } else if messageLabel.text == greatMessage {
//            messageLabel.text = bombMessage
//            imageView.image = UIImage(named: "image2")
//        } else {
//            messageLabel.text = awesomeMessage
//            imageView.image = UIImage(named: "image0")
//        }
    }
}
