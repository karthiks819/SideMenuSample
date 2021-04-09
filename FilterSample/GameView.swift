//
//  GameView.swift
//  FilterSample
//
//  Created by KarthikSai on 19/12/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import UIKit
@IBDesignable
open class GameView: UIView {
    @IBInspectable
    public var cornerRadius: CGFloat = 2.0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }
    
    

}
