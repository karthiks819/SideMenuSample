//
//  TestConstraintsViewController.swift
//  FilterSample
//
//  Created by KarthikSai on 25/12/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import UIKit

class SideMenuSampleVC: BaseViewController {
    @IBOutlet weak var imgView2: UIImageView!
    @IBOutlet weak var imgView1: UIImageView!
    @IBOutlet weak var imagesView: UIView!
    @IBOutlet weak var widthConstraintImagesView: NSLayoutConstraint!
    @IBOutlet weak var imgView2WidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var btnSlidemenu: UIButton!
    @IBOutlet weak var imgView1WidthConstraint: NSLayoutConstraint!
    static var isClosedMenu = true
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.leftImage()
//        self.twoImagesHidden()
        self.imgView2WidthConstraint.constant = 0
        self.imgView1WidthConstraint.constant = 0
//        self.btnSlidemenu.addTarget(BaseViewController.self, action: #selector(BaseViewController.slideMenuButtonPressed(_:)), for: .touchUpInside)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture(sender:)))
               self.view.addGestureRecognizer(panGesture)
    }
    
    @objc func panGesture(sender: UIPanGestureRecognizer){
//        let point = sender.location(in: view)
//        let panGesture = sender.view
//        panGesture?.center = point
//        print(point)
        
        
        switch sender.state {
        case .began: break
        case .changed: break
        case .cancelled: break
        case .ended:
            if SideMenuSampleVC.isClosedMenu{
                SideMenuSampleVC.isClosedMenu = false
            slideMenuButtonPressed(UIButton())
                
            }
            break
        default:
            break
        }
    }

    func leftImage() {
        widthConstraintImagesView.constant = 36
        self.imgView2.isHidden = true
    }
    
    func twoImagesHidden() {
        widthConstraintImagesView.constant = 0
        self.imgView2.isHidden = true
        self.imgView1.isHidden = true
    }

    @IBAction func btnMenuAction(_ sender: UIButton) {
//        sender.tag =  0
//       slideMenuButtonPressed(sender)
        
        if SideMenuSampleVC.isClosedMenu{
            SideMenuSampleVC.isClosedMenu = false
        slideMenuButtonPressed(UIButton())
            
        }
    }
}
