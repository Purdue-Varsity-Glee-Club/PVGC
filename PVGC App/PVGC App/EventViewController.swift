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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testLabel.text = event?.location
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "conflictReportSegue"){
            let reportViewController = segue.destination as! ReportConflictViewController
            reportViewController.event = self.event
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
