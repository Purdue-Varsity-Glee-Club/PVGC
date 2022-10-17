//
//  ConflictsViewController.swift
//  PVGC App
//
//  Created by Eliel Kilembo on 6/1/22.
//

import UIKit
import Parse

class ConflictsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var conflictsTable: UITableView!
    var event:Event?
    var conflicts:[Conflict] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        conflictsTable.delegate = self;
        conflictsTable.dataSource = self;
        
        let query = PFQuery(className: "Conflicts")
        query.includeKeys(["contact","user","event"])
        query.findObjectsInBackground{(conflicts, error) in
            if(conflicts == nil){
                print(error?.localizedDescription)
            }else{
                let currentConflicts = conflicts as! [PFObject]
                for currentConflict in currentConflicts {
                    let event = currentConflict["event"] as! PFObject
                    if (event.objectId == self.event?.object?.objectId){
                        self.conflicts.append(Conflict(dictionary: currentConflict))
                    }
                }
                self.conflictsTable.reloadData()
            }
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.conflicts.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "conflictCell") as! ConflictCell
        let conflict = self.conflicts[indexPath.row]
        let reasonIndex = conflict.reason
        var reason:String?
        /*
         
         0-Arriving late, 1-Missing event,2-Class Conlfict,3-Personal Conflict
         */
        switch(reasonIndex){
        case 0:
            reason = "Arriving Late"
            break;
        case 1:
            reason = "Class Conflict"
            break;
        case 2:
            reason = "Personal Conflict/Other"
            break;
        default:
            break;
        }
        
        cell.nameLabel.text = conflict.name
        cell.reasonLabel.text = reason        
        /* Sample text to test long responses
         
         "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
         
         */
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "loadUserConflictSegue", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if(segue.identifier == "loadUserConflictSegue"){
//            let detailsViewController = segue.destination as! ConflictDetailsViewController
//            if let indexPath = sender as? IndexPath {
//                let conflict = self.conflicts[indexPath.row]
//                var reason:String?
//                switch(conflict.reason){
//                case 0:
//                    reason = "Arriving Late"
//                    break;
//                case 1:
//                    reason = "Class Conflict"
//                    break;
//                case 2:
//                    reason = "Personal Conflict/Other"
//                    break;
//                default:
//                    break;
//                }
//                detailsViewController.reason = reason
//                detailsViewController.name = conflict.name
//                detailsViewController.details = conflict.details
//            }
//        }
    }
        

    @IBAction func onBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil);
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
