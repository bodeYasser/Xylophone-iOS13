//  ViewController.swift
//  Xylophone
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
import AVFoundation
import UIKit

class ViewController: UIViewController {

    var player : AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        //get the name of the button
        guard let buttonName =  sender.titleLabel?.text else {return}

            playSound(buttonName: buttonName)
        changeButtonOpicty(button: sender)
    }
        
        //get name of the button ,then play sound from bundle
    func playSound(buttonName : String){
        
        guard  let url = Bundle.main.url(forResource: buttonName, withExtension: "wav") else {return}
       do {
           
           //make sound plays when mobile is silent or in background
            //try AVAudioSession.sharedInstance().setCategory(.playback, mode:  .default)
           // try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url)
           player?.play()
       }
        catch { print("er00000ror") }
    }
        
    /*change the opacity of button to 0.5 then restore it to 1 after
    0.2 second
     */
   func changeButtonOpicty(button : UIButton){
       button.alpha = 0.5
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        button.alpha = 1
        }
    }
}

