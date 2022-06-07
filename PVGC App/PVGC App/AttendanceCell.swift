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
        let eventObject = self.event?.object
        var users = eventObject!["attendance"] as! [PFUser]
        if(self.attendanceCheck.isOn){
            users.append(PFUser.current()!)
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
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
