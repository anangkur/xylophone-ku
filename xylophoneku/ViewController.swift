//
//  ViewController.swift
//  xylophoneku
//
//  Created by Anang Kurniawan on 17/10/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonClicked(_ sender: UIButton) {
        rippleEffect(sender: sender)
        playSound(soundName: sender.titleLabel?.text ?? "")
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    func rippleEffect(sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            sender.alpha = 0.5
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2 ) {
            UIView.animate(withDuration: 0.2) {
                sender.alpha = 1.0
            }
        }
    }
}

