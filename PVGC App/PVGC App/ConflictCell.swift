//
//  ConflictCell.swift
//  PVGC App
//
//  Created by Eliel Kilembo on 6/1/22.
//

import UIKit

class ConflictCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var reasonLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func onContactButton(_ sender: Any) {
    }
    @IBAction func onAcceptButton(_ sender: Any) {
    }
    
    @IBAction func onDenyButton(_ sender: Any) {
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
