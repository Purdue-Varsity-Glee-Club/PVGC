//
//  EventViewController.swift
//  PVGC App
//
//  Created by Eliel Kilembo on 5/24/22.
//

import UIKit
import Parse

class EventViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    var event:Event?
    @IBOutlet weak var manageConflictsButton: UIButton!
    @IBOutlet weak var editEventButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testLabel.text = event?.location
        let user = PFUser.current()
        let role = user!["role"]
        if(role as! String == "regular"){
            manageConflictsButton.alpha = 0;
            editEventButton.alpha = 0;
        }
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let id = segue.identifier;
        switch(id){
            case "conflictReportSegue":
                let reportViewController = segue.destination as! ReportConflictViewController
                reportViewController.event = self.event
                break;
            case "manageConflictSegue":
                let conflictsViewController = segue.destination as! ConflictsViewController
                conflictsViewController.event = self.event;
                break;
            case .none: break
            case .some(_):break
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
