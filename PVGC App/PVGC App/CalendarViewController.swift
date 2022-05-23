//
//  CalendarViewController.swift
//  PVGC App
//
//  Created by Eliel Kilembo on 5/23/22.
//

import UIKit

class CalendarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var date:String = "";
    var eventData:[[String:Any?]] = []
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventCell
        cell.eventText.text = self.date
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
            eventsTable.reloadData()
        }
        // Do any additional setup after loading the view.
    }
    
    @objc func dateChanged(_ sender:UIDatePicker){
        let components = Calendar.current.dateComponents([.year, .month, .day], from: sender.date)
        if let day = components.day, let month = components.month, let year = components.year {
            //print("\(day) \(month) \(year)")
            setDate(day: String(day), month: String(month), year: String(year))
        }
    }
    
    func setDate(day:String, month:String, year:String){
        self.date = day + " " + month + " " + year;
        eventsTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "eventSelected", sender: self)
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
