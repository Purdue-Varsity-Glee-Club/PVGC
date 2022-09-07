//
//  AttendanceCell.swift
//  PVGC App
//
//  Created by Eliel Kilembo on 6/6/22.
//

import UIKit
import Parse


class AttendanceCell: UITableViewCell {
    
    var event:Event?
    var user:PFObject?
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var attendanceCheck: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func onTicker(_ sender: Any) {
        var eventObject = self.event?.object
        var nonEmptyUsers = eventObject!["attendance"] as! [PFObject]
        if(self.attendanceCheck.isOn){
            nonEmptyUsers.append(user!)
            eventObject!["attendance"] = nonEmptyUsers;
        }else{
            var i = 0;
            for user in nonEmptyUsers{
                if user == PFUser.current(){
                    nonEmptyUsers.remove(at: i)
                    break;
                }
                i+=1;
            }
            eventObject?["attendance"] = nonEmptyUsers
        }
        
        eventObject?.saveInBackground{(success, error) in
            if(success == nil){
                print(error!.localizedDescription as String)
            }else{
                print("Successfully Saved")
            }
        }
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
