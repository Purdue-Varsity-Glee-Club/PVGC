//
//  AddEventViewController.swift
//  PVGC App
//
//  Created by Eliel Kilembo on 6/15/22.
//

import UIKit
import Parse

class AddEventViewController: UIViewController {

    @IBOutlet weak var detailsTextField: UITextField!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var hourPicker: UIPickerView!
    @IBOutlet weak var minutePicker: UIPickerView!
    @IBOutlet weak var amPmPicker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.


    }
    
    @objc func dateChanged(_ sender:UIDatePicker){
        
    }

    @IBAction func onSaveButton(_ sender: Any) {
        var eventObject = PFObject(className: "Events")
        eventObject["type"] = 0
        eventObject["location"] = locationTextField.text
        eventObject["date"] =
        eventObject["calltime"]
        eventObject["primaryContact"] = "managers"  // Change it to the role of the actual user/usernames
        eventObject["dressCode"]
        eventObject["details"]
        eventObject["status"]
        eventObject["attendance"]
    }
    @IBAction func onCancelButton(_ sender: Any) {
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
