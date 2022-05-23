//
//  EventCell.swift
//  PVGC App
//
//  Created by Eliel Kilembo on 5/23/22.
//

import UIKit

class EventCell: UITableViewCell {

    @IBOutlet weak var eventText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
