//
//  Trick.swift
//  Kiptonite
//
//  Created by Ian W. Howe on 5/12/16.
//  Copyright © 2016 Ian W. Howe. All rights reserved.
//

import Foundation
class Trick {
    
    var name: String
    var difficulty: String
    var description: String
    var event: Int //Olympic order for events, starting at 1 (0 is reserved for the allevents filter)
    var gender: Int //0 = Both | 1 = Male | 2 = Female
    var status: Int //0 = Disover | 1 = Learn | 2 = Master
    var url: NSURL
    
    init() {
        name = ""
        difficulty = ""
        description = ""
        event = -1
        gender = -1
        status = -1
        url = NSURL()
    }
    
    init(Name: String, Difficulty: String, Description: String, Event: Int, Gender: Int, Status: Int, URL: NSURL) {
        name = Name
        difficulty = Difficulty
        description = Description
        event = Event
        gender = Gender
        status = Status
        url = URL
    }
    
    
    
    
    
    
    
}