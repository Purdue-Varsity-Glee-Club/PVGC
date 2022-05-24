//
//  ConflictViewController.swift
//  PVGC App
//
//  Created by Eliel Kilembo on 5/24/22.
//

import UIKit

class ReportConflictViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
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
        // Do any additional setup after loading the view.
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
