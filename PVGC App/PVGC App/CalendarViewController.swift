//
//  CalendarViewController.swift
//  PVGC App
//
//  Created by Eliel Kilembo on 5/23/22.
//

import UIKit
import Parse

class CalendarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var date:String = "";
    var eventData:[[String:Any?]] = []
    var fetchedEvents = [PFObject]()
    var events:[Event] = []
    var filteredEvents:[Event] = []

    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredEvents.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventCell
//        if (filteredEvents.count == 0){
//            return cell;
//        }
        let event = filteredEvents[indexPath.row]
        cell.eventText.text = event.location
        return cell;
    }
    

    @IBOutlet weak var eventsTable: UITableView!
    @IBOutlet weak var calendar: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        eventsTable.delegate = self;
        eventsTable.dataSource = self;
        calendar.preferredDatePickerStyle = .inline;
        calendar.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        let components = Calendar.current.dateComponents([.year, .month, .day], from: calendar.date)
        
        if let day = components.day, let month = components.month, let year = components.year {
            //print("\(day) \(month) \(year)")
            setDate(day: String(day), month: String(month), year: String(year))
            getEvents(day: String(day), month: String(month), year: String(year))
        }
    
    }
    
    func getEvents(day:String, month:String, year:String){
        let query = PFQuery(className: "Events")
        query.limit = 100
        query.findObjectsInBackground{(events, error) in
            if events == nil{
                print(error?.localizedDescription as Any)
            }else{
                
                self.fetchedEvents = events!
                for event in self.fetchedEvents {
                    self.events.append(Event(dictionary: event))
                }
                self.loadEvents(day: day, month: month, year: year)
            }
        }
    }
    
    func loadEvents(day:String, month:String, year:String){
        let filter = day + "-" + month + "-" + year;
        self.filteredEvents = EventsAPI.getDateEvents(date: filter, events:self.events)
        print(self.filteredEvents)
        self.eventsTable.reloadData()
    }
    
    @objc func dateChanged(_ sender:UIDatePicker){
        let components = Calendar.current.dateComponents([.year, .month, .day], from: sender.date)
        if let day = components.day, let month = components.month, let year = components.year {
            //print("\(day) \(month) \(year)")
            setDate(day: String(day), month: String(month), year: String(year))
            loadEvents(day: String(day), month: String(month), year: String(year))
        }
    }
    
    func setDate(day:String, month:String, year:String){
        self.date = day + " " + month + " " + year;
        eventsTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "eventSelected", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "eventSelected"){
            if let indexPath = sender as? IndexPath {
                let event = self.filteredEvents[indexPath.row]
                let eventViewContoller = segue.destination as! EventViewController
                eventViewContoller.event = event
            }
        }else if(segue.identifier == "conflictSelected"){
            let components = Calendar.current.dateComponents([.year, .month, .day], from: calendar.date)
            
            if let day = components.day, let month = components.month, let year = components.year {
                //print("\(day) \(month) \(year)")
                setDate(day: String(day), month: String(month), year: String(year))
                getEvents(day: String(day), month: String(month), year: String(year))
            }
        }
    }
    
    
    
    /*
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
