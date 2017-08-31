//
//  Story.swift
//  Destini
//
//  Created by Stephen Skubik-Peplaski on 8/31/17.
//  Copyright © 2017 London App Brewery. All rights reserved.
//

import Foundation

class Story {
    let storyText: String
    let answer1: String
    let answer2: String
    let storyLink1: Int
    let storyLink2: Int
    
    init(text: String, ans1: String, ans2: String, link1: Int, link2: Int) {
        storyText = text
        answer1 = ans1
        answer2 = ans2
        storyLink1 = link1
        storyLink2 = link2
    }
}
