//
//  Event.swift
//  PVGC App
//
//  Created by Eliel Kilembo on 5/23/22.
//

import Foundation
import Parse
class Event{
    var type:Int?
    var location:String?
    var calltime:String?
    var date:String?
    var duration:String?
    var dressCode:String?
    var details:String?
    var object:PFObject?
    
    init(dictionary:PFObject){
        self.type = dictionary["type"] as? Int
        self.date = dictionary["date"] as? String
        self.location = dictionary["location"] as? String
        self.calltime = dictionary["calltime"] as? String
        self.duration = dictionary["duration"] as? String
        self.dressCode = dictionary["dressCode"] as? String
        self.details = dictionary["details"] as? String
        self.object = dictionary
    }
}
