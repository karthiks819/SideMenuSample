//
//  FilterTableViewCell.swift
//  FilterSample
//
//  Created by KarthikSai on 11/09/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import UIKit




class FilterTableViewCell: UITableViewCell{
    
    
    


    @IBOutlet weak var btnSelect: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
   
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
