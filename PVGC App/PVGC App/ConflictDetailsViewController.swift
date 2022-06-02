//
//  ConflictDetailsViewController.swift
//  PVGC App
//
//  Created by Eliel Kilembo on 6/1/22.
//

import UIKit

class ConflictDetailsViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var reasonLabel: UILabel!
    var conflict:Conflict?
    
    var name:String?
    var details:String?
    var reason:String?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLabel.text = name
        detailsLabel.text = details
        reasonLabel.text = reason
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
