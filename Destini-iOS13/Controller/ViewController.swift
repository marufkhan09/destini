//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    var storyBrain = StoryBrain()
    override func viewDidLoad() {
        storyLabel.text = storyBrain.example[storyBrain.destination].title
        choice1Button.setTitle(storyBrain.example[storyBrain.destination].choice1, for: .normal)
        choice2Button.setTitle(storyBrain.example[storyBrain.destination].choice2, for: .normal)
        super.viewDidLoad()

    }

    @IBAction func choiceTapped(_ sender: UIButton) {
        updateUI(selectedChoice: storyBrain.destination,sender: sender)
    }
    
    
    @objc func updateUI(selectedChoice: Int,sender:UIButton){
        
        storyLabel.text = storyBrain.nextStory(selectedDest: selectedChoice).title
        choice1Button.setTitle(storyBrain.nextStory(selectedDest: selectedChoice).choice1, for: .normal)
        choice2Button.setTitle(storyBrain.nextStory(selectedDest: selectedChoice).choice2, for: .normal)
        
        if(sender.currentTitle! == choice1Button.titleLabel!.text){
            storyBrain.updateDestination(storyNo: storyBrain.nextStory(selectedDest: selectedChoice).choice1Destination)
        }else{
            storyBrain.updateDestination(storyNo: storyBrain.nextStory(selectedDest: selectedChoice).choice2Destination)
        }
        
    }
    
}

