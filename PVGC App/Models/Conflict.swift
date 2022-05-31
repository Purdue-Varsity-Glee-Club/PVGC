//
//  Conflict.swift
//  PVGC App
//
//  Created by Eliel Kilembo on 5/23/22.
//

import Foundation
import Parse

class Conflict{
    var event:Event?            // The event object for the specified conflict
    var user:PFUser?            // The user reporting the conflict
    var reason:Int?             // The basic reason for the user's conflict
    var contact:[PFObject]?     // The users getting notified
    var details:String?         // The details of the conflict, anything else the user wants the contact to know
    var status:Int?             // The contact's decision 0 - Excused, 1- Denied, 2 - Undecided(default)
    
    init(dictionary:PFObject){
        self.event = Event(dictionary:dictionary["event"] as! PFObject)
        self.user = dictionary["user"] as? PFUser
        self.reason = dictionary["reason"] as? Int
        self.contact = dictionary["contact"] as? [PFUser]
        self.details = dictionary["details"] as? String
        self.status = dictionary["status"] as? Int
    }
}
