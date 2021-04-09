//
//  GTView.swift
//  FilterSample
//
//  Created by KarthikSai on 19/12/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import UIKit

class GTView: UIView {

    @IBOutlet weak var viewPlayer6: UIView!
    @IBOutlet weak var viewPlayer5: UIView!
    @IBOutlet weak var viewPlayer4: UIView!
    @IBOutlet weak var viewPlayer3: UIView!
    @IBOutlet weak var viewPlayer2: UIView!
    @IBOutlet weak var viewPlayer1: UIView!
    @IBOutlet weak var gameTableView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        let height = self.gameTableView.frame.height
        self.gameTableView.layer.cornerRadius = height / 2.0
        print("height :: \(height)")
        print(height / 2)
//        self.gameTableView.layer.masksToBounds = true
        
        self.gameTableView.layer.borderColor = UIColor.white.cgColor
        self.gameTableView.layer.borderWidth = 3
        
        self.gameTableView.backgroundColor = UIColor.clear
        
        let xxx = self.frame.size.width / 10
        let yyy = self.frame.size.height / 7
        
        let sampleView = UIView(frame: CGRect(x: xxx, y: yyy, width: self.frame.width - 72, height: self.frame.height - 121))
        
        sampleView.backgroundColor = UIColor.yellow
        self.addSubview(sampleView)
        self.viewPlayer1.layer.cornerRadius = self.viewPlayer1.frame.height / 2
        self.viewPlayer2.layer.cornerRadius = self.viewPlayer1.frame.height / 2
        self.viewPlayer3.layer.cornerRadius = self.viewPlayer1.frame.height / 2
        self.viewPlayer4.layer.cornerRadius = self.viewPlayer1.frame.height / 2
        self.viewPlayer5.layer.cornerRadius = self.viewPlayer1.frame.height / 2
        self.viewPlayer6.layer.cornerRadius = self.viewPlayer1.frame.height / 2
        
    }

}
