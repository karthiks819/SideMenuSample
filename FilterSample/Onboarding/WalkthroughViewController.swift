//
//  WalkthroughViewController.swift
//  Tapster
//
//  Created by Tapster on 01/04/19.
//  Copyright © 2019 Tapster. All rights reserved.
//

import UIKit

class WalkthroughViewController: UIViewController, WalkthroughPageViewControllerDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet var pageControl: UIPageControl!
    
    @IBOutlet var nextButton: UIButton! {
        didSet {
            nextButton.layer.cornerRadius = 25.0
            nextButton.layer.masksToBounds = true
        }
    }
    
    @IBOutlet var skipButton: UIButton!
    
    // MARK: - Properties
    
    var walkthroughPageViewController: WalkthroughPageViewController?
    
    // MARK: - Actions
    
    @IBAction func skipButtonTapped(sender: UIButton) {
        UserDefaults.standard.set(true, forKey: "hasViewedWalkthrough")
        self.performSegue(withIdentifier: "DeliverySegueID", sender: self)
    }
    
    @IBAction func nextButtonTapped(sender: UIButton) {
        if let index = walkthroughPageViewController?.currentIndex {
            switch index {
            case 0:
                walkthroughPageViewController?.forwardPage()
            case 1:
                walkthroughPageViewController?.forwardPage()
            case 2:
                UserDefaults.standard.set(true, forKey: "hasViewedWalkthrough")
                self.performSegue(withIdentifier: "DeliverySegueID", sender: self)
                
            default: break
            }
        }
        
        updateUI()
    }
    
    func updateUI() {
        if let index = walkthroughPageViewController?.currentIndex {
            switch index {
            case 0:
                nextButton.setTitle("NEXT", for: .normal)
                nextButton.setTitleColor(UIColor(red: 86/255, green: 43/255, blue: 194/255, alpha: 1), for: UIControl.State.normal)
                skipButton.isHidden = false
                pageControl.isHidden = false
                nextButton.setBackgroundImage(UIImage(named: ""), for: .normal)
            case 1:
                nextButton.setTitle("NEXT", for: .normal)
                nextButton.setTitleColor(UIColor(red: 86/255, green: 43/255, blue: 194/255, alpha: 1), for: UIControl.State.normal)
                skipButton.isHidden = false
                pageControl.isHidden = false
                nextButton.setBackgroundImage(UIImage(named: ""), for: .normal)
            case 2:
                nextButton.setTitle("GET STARTED", for: .normal)
                //nextButton.setGradientBackground()+
                nextButton.setBackgroundImage(UIImage(named: "footerBtnBG"), for: .normal)
                nextButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
                nextButton.layer.cornerRadius = 10
                nextButton.layer.masksToBounds = true
                skipButton.isHidden = true
                pageControl.isHidden = true
                
            default: break
            }
            pageControl.currentPage = index
        }
    }
    
    func didUpdatePageIndex(currentIndex: Int) {
        updateUI()
    }
    
    // MARK: - View controller life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let pageViewController = destination as? WalkthroughPageViewController {
            walkthroughPageViewController = pageViewController
            walkthroughPageViewController?.walkthroughDelegate = self
        }
    }
    
    
}
