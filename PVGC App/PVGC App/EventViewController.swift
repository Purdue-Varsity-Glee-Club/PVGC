//
//  EventViewController.swift
//  PVGC App
//
//  Created by Eliel Kilembo on 5/24/22.
//

import UIKit
import Parse

class EventViewController: UIViewController {

    @IBOutlet weak var attenanceTicker: UISwitch!
    @IBOutlet weak var testLabel: UILabel!
    var event:Event?
    @IBOutlet weak var eventDetails: UITextView!
    @IBOutlet weak var manageConflictsButton: UIButton!
    @IBOutlet weak var editEventButton: UIButton!
    
    @IBOutlet weak var attendanceButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        eventDetails.text = event?.location
        let user = PFUser.current()
        let role = user!["role"]
        if(role as! String == "regular"){
            manageConflictsButton.alpha = 0;
            editEventButton.alpha = 0;
        }
        // Do any additional setup after loading the view.
    }
    @IBAction func onTicker(_ sender: Any) {
        let eventObject = self.event?.object
        var users = eventObject!["attendance"] as! [PFUser]
        if(self.attenanceTicker.isOn){
  // TODO          users.append(PFUser.current()!)
            eventObject!["attendance"] = users;
        }else{
            var i = 0;
            for user in users{
                if user == PFUser.current(){
                    users.remove(at: i)
                    break;
                }
                i+=1;
            }
            eventObject?["attendance"] = users
        }
        
        eventObject?.saveInBackground{(success, error) in
            if(success == nil){
                print(error!.localizedDescription as String)
            }else{
                print("Successfully Saved")
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        let id = segue.identifier;
//        switch(id){
//            case "conflictReportSegue":
//                let reportViewController = segue.destination as! ReportConflictViewController
//                reportViewController.event = self.event
//                break;
//            case "manageConflictSegue":
//                let conflictsViewController = segue.destination as! ConflictsViewController
//                conflictsViewController.event = self.event;
//                break;
//            case "attendanceSegue":
//                let attendanceViewController = segue.destination as! AttendanceViewController
//                attendanceViewController.event = self.event;
//                break;
//            case .none: break
//            case .some(_):break
//        }
        
    }
    @IBAction func onBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
