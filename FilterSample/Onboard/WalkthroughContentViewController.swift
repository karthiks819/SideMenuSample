//
//  WalkthroughContentViewController.swift
//  Tapster
//
//  Created by Tapster on 01/04/19.
//  Copyright © 2019 Tapster. All rights reserved.
//

import UIKit

class WalkthroughContentViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var headingLabel: UILabel! {
        didSet {
            headingLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet weak var subHeadingLabel: UILabel!{
        didSet {
            subHeadingLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var contentImageView: UIImageView!
    // MARK: - Properties
    var index = 0
    var heading = ""
    var imageFile = ""
    var lblDescription = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headingLabel.text = heading
        contentImageView.image = UIImage(named: imageFile)
        subHeadingLabel.text = lblDescription
    }
}
