//
//  DataCell.swift
//  FilterSample
//
//  Created by KarthikSai on 11/09/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import UIKit

class DataCell: UITableViewCell {

    @IBOutlet weak var lblPlayingCount: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblPlayers: UILabel!
    @IBOutlet weak var lblBetAmount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }

}
