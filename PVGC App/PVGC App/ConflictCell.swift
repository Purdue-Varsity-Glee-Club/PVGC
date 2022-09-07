//
//  ConflictCell.swift
//  PVGC App
//
//  Created by Eliel Kilembo on 6/1/22.
//

import UIKit

class ConflictCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contactButton: UIButton!
    
    @IBOutlet weak var acceptButton: UIButton!
    @IBOutlet weak var reasonLabel: UILabel!
    @IBOutlet weak var denyButton: UIButton!
    var conflict:Conflict?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func onContactButton(_ sender: Any) {
        let instagramHooks = "slack://"
        let instagramUrl = URL(string: instagramHooks)!
        if UIApplication.shared.canOpenURL(instagramUrl)
        {
            UIApplication.shared.open(instagramUrl)
        } else {
            //redirect to safari because the user doesn't have Instagram
            UIApplication.shared.open(URL(string: "http://slack.com/")!)
        }
    }
    @IBAction func onAcceptButton(_ sender: Any) {
        self.conflict?.object?["status"] = 0;
        self.conflict?.object?.saveInBackground{(success, error) in
            if((error) != nil){
                print(error?.localizedDescription)
            }else{
                self.acceptButton.isEnabled = false;
                if(self.denyButton.isEnabled == false){
                    self.denyButton.isEnabled = true
                }
            }
        }
    }
    
    @IBAction func onDenyButton(_ sender: Any) {
        self.conflict?.object?["status"] = 1;
        self.conflict?.object?.saveInBackground{(success, error) in
            if((error) != nil){
                print(error?.localizedDescription)
            }else{
                self.denyButton.isEnabled = false;
                if(self.acceptButton.isEnabled == false){
                    self.acceptButton.isEnabled = true
                }
            }
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
