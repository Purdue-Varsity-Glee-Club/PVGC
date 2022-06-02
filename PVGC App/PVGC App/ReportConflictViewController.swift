//
//  ConflictViewController.swift
//  PVGC App
//
//  Created by Eliel Kilembo on 5/24/22.
//

import UIKit
import Parse

class ReportConflictViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var event:Event?
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var detailsField: UITextField!
    @IBOutlet weak var updateButton: UIButton!
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.options[row];
    }
    
    var options:[String] = ["Arriving Late","Not Attending", "Class Conflict", "Custom"]
    
    @IBOutlet weak var conflictOptions: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        conflictOptions.dataSource = self;
        conflictOptions.delegate = self;
        updateButton.alpha = 0;
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onUpdateButton(_ sender: Any) {
        // TODO finish update conflict
    }
    
    @IBAction func onSave(_ sender: Any) {

        var conflict = PFObject(className:"Conflicts")
        let query = PFQuery(className: "Members")
        query.whereKey("role", contains: "manager")
        query.findObjectsInBackground{(managers: [PFObject]?, error) in
            if managers == nil{
                print(error?.localizedDescription as Any)
            }else{
                conflict["contact"] = managers
                conflict["user"] = PFUser.current()
                conflict["event"] = self.event?.object
                conflict["reason"] = self.conflictOptions.selectedRow(inComponent: 0)
                conflict["details"] = self.detailsField.text
                conflict["status"] = 2;
                // Saves the new object.
                conflict.saveInBackground {
                  (success: Bool, error: Error?) in
                  if (success) {
                      self.successfulConflictReport()
//                      self.dismiss(animated: true, completion: nil)
                  } else {
                      print(error?.localizedDescription)
                  }
                }
            }
        }
    }
    
    func successfulConflictReport(){
        let alert = UIAlertController(title: "Done!", message: "Message", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        present(alert,animated: true){
            self.presentingViewController?.dismiss(animated: true, completion: nil)
            self.saveButton.isEnabled = false;
            self.updateButton.alpha = 1;
        }
    
    }
    

}
