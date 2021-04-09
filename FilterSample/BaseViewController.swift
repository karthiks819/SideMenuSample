//
//  BaseViewController.swift
//  FilterSample
//
//  Created by Karthik on 26/12/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, SlideMenuDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func slideMenuItemSelectedAtIndex(_ index: Int32) {
        let topViewController : UIViewController = self.navigationController!.topViewController!
        print("View Controller is : \(topViewController) \n", terminator: "")
        switch(index){
//        case 0:
//            print("Home\n", terminator: "")
//
//            self.openViewControllerBasedOnIdentifier("Home")
//
//            break
//        case 1:
//            print("Play\n", terminator: "")
//
//            self.openViewControllerBasedOnIdentifier("PlayVC")
//
//            break
        default:
            print("default\n", terminator: "")
        }
    }
    
   
    public func slideMenuClose(_ sender: UIButton) {
        let viewMenuBack = view.subviews.last!
                 UIView.animate(withDuration: 0.3, animations: { () -> Void in
                      var frameMenu : CGRect = viewMenuBack.frame
                      frameMenu.origin.x = -1 * UIScreen.main.bounds.size.width
                      viewMenuBack.frame = frameMenu
                      viewMenuBack.layoutIfNeeded()
                      viewMenuBack.backgroundColor = UIColor.clear
                      }, completion: { (finished) -> Void in
                          viewMenuBack.removeFromSuperview()
                  })
    }
    

    public func slideMenuButtonPressed(_ sender: UIButton) {
        if sender.tag == 10 {
            //Hide menu is it is already presented on the screen
            self.slideMenuItemSelectedAtIndex(-1)
            sender.tag = 0
            let viewMenuBack = view.subviews.last!
           UIView.animate(withDuration: 0.3, animations: { () -> Void in
                var frameMenu : CGRect = viewMenuBack.frame
                frameMenu.origin.x = -1 * UIScreen.main.bounds.size.width
                viewMenuBack.frame = frameMenu
                viewMenuBack.layoutIfNeeded()
                viewMenuBack.backgroundColor = UIColor.clear
                }, completion: { (finished) -> Void in
                    viewMenuBack.removeFromSuperview()
            })
            return
        }
        sender.isEnabled = false
        sender.tag = 10
        if #available(iOS 13.0, *) {
            let menuVC: ScrollViewTestViewController = self.storyboard?.instantiateViewController(withIdentifier: "slidemenu") as! ScrollViewTestViewController
            menuVC.btnMenu = sender
            menuVC.delegate = self
            self.view.addSubview(menuVC.view)
            self.addChild(menuVC)
            menuVC.view.layoutIfNeeded()
            
            menuVC.view.frame=CGRect(x: 0 - UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
                   
                   UIView.animate(withDuration: 0.3, animations: { () -> Void in
                       menuVC.view.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
                       sender.isEnabled = true
                       }, completion:nil)
            
        } else {
            let menuVC: ScrollViewTestViewController = self.storyboard?.instantiateViewController(withIdentifier: "slidemenu") as! ScrollViewTestViewController
            menuVC.btnMenu = sender
            menuVC.delegate = self
            self.view.addSubview(menuVC.view)
            self.addChild(menuVC)
            menuVC.view.layoutIfNeeded()
            
            menuVC.view.frame=CGRect(x: 0 - UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
            
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                menuVC.view.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
                sender.isEnabled = true
            }, completion:nil)
        }
        
        
    }
}
