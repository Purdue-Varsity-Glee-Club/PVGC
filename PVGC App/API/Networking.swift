//
//  Networking.swift
//  PVGC App
//
//  Created by Eliel Kilembo on 5/23/22.
//
//

import Foundation
import Parse

/*
 
 Networking API
 
 Contains: Functions that make network calls
 - getEvents: Fetches all events from the Events table in the database, puts them into an event array and returns the array to be used in different view controllers.

 
*/

struct NetworkingAPI{
//    func getEvents()
   static  func getEvents()->[PFObject]{
        var toReturn = [PFObject]()
        let query = PFQuery(className: "Events")
        query.findObjectsInBackground{(events, error) in
            if events == nil{
                print(error?.localizedDescription)
            }else{
                toReturn = events!
            }
        }
        return toReturn
    }
}


/*
 
 Events API
 Contains: Functions that process events, load
 
*/

struct EventsAPI{
    static func getDateEvents(date:String,events:[Event])->[Event]{
        var toReturn:[Event] = []
        for event in events{
            if event.date == date {
                toReturn.append(event)
            }
        }
        return toReturn;
    }
    
    func getConflicts(event:Event)->[Conflict]{
        return []
    }
    
    func createConflict(event:Event){
        
    }
}
