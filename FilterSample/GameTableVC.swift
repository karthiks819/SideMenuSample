//
//  GameTableVC.swift
//  FilterSample
//
//  Created by KarthikSai on 19/12/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import Foundation
import UIKit


class GameTableVC: ViewController {
    
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadUI()
    }
    
    func loadUI() {
        let tView = (UINib(nibName: "GTView", bundle: nil).instantiate(withOwner: nil, options: nil).last as? GTView)!
        tView.frame = CGRect(x: 0, y: 0, width: self.containerView.frame.width, height: self.containerView.frame.height)
        self.containerView.addSubview(tView)
        
    }
    
}
