//
//  ViewController.swift
//  Destini
//
//  Created by Philipp Muellauer on 01/09/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!         // Has TAG = 1
    @IBOutlet weak var bottomButton: UIButton!      // Has TAG = 2
    @IBOutlet weak var storyTextView: UILabel!
    
    // TODO Step 5: Initialise instance variables here
    let story = StoryStructure()
    var currentSceneNumber: Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadStory(sceneNumber: currentSceneNumber)
    }

    fileprivate func loadStory(sceneNumber: Int) {
        let scene = story.scenes[sceneNumber]
        
        storyTextView.text = scene?.storyText
        topButton.setTitle(scene?.answer1, for: .normal)
        bottomButton.setTitle(scene?.answer2, for: .normal)
        
        if scene?.storyLink1 == 0 {
            topButton.isHidden = true
        }
        
        if scene?.storyLink2 == 0 {
            bottomButton.setTitle("Restart", for: .normal)
        }
        
        currentSceneNumber = sceneNumber
    }
    
    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
    
        let scene = story.scenes[currentSceneNumber]

        if sender.tag == 1 {
            loadStory(sceneNumber: (scene?.storyLink1)!)
        } else if sender.tag == 2 {
            let newSceneNumber = (scene?.storyLink2)!
            if newSceneNumber == 0 {
                loadStory(sceneNumber: 1)
                topButton.isHidden = false
            } else {
                loadStory(sceneNumber: newSceneNumber)
            }
        }
    }
}

