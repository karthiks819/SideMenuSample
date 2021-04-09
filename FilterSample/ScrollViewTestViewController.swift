//
//  ScrollViewTestViewController.swift
//  FilterSample
//
//  Created by KarthikSai on 21/12/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import UIKit

protocol SlideMenuDelegate {
    func slideMenuItemSelectedAtIndex(_ index : Int32)
}

class ScrollViewTestViewController: BaseViewController, UIGestureRecognizerDelegate {
    
    
    @IBOutlet weak var btnOverlayView: UIButton!
    @IBOutlet weak var tblView: UITableView!
    let arr = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"]
    var modelArr = [TableModel]()
    
    /**
     *  Menu button which was tapped to display the menu
     */
    var btnMenu : UIButton!
    /**
     *  Delegate of the MenuVC
     */
    var delegate : SlideMenuDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblView.delegate = self
        
        self.tblView.dataSource = self
        
        // Do any additional setup after loading the view.
        self.setupData()
        self.tblView.reloadData()
        
        
    }
    
    
    func setupData() {
        let sec1 = TableModel(leftImageName: "", sectionHeaderTitle: arr.first!, isHavingSubItems: false, subItems: [""], isExpanded: false)
        modelArr.append(sec1)
        let sec2 = TableModel(leftImageName: "", sectionHeaderTitle: arr[1], isHavingSubItems: false, subItems: [""], isExpanded: false)
        modelArr.append(sec2)
        let sec3 = TableModel(leftImageName: "", sectionHeaderTitle: arr[2], isHavingSubItems: true, subItems: ["1","2"] , isExpanded: false)
        let sec4 = TableModel(leftImageName: "", sectionHeaderTitle: arr[3], isHavingSubItems: true, subItems: ["aaa", "bbb"], isExpanded: false)
        
        modelArr.append(sec3)
        modelArr.append(sec4)
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func btnOverlayViewAction(_ sender: UIButton) {
        btnMenu.tag = 0
        
        //        if (self.delegate != nil) {
        //            var index = Int32(sender.tag)
        //            if(sender == self.btnOverlayView){
        //                index = -1
        //            }
        //        }
        if #available(iOS 13.0, *) {
            self.closeSlideMenuBar()
        } else {
            self.closeSlideMenuBar()
        }
    }
    
    
}






extension ScrollViewTestViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = modelArr[section]
        if data.isExpanded {
            return data.subItems.count
        }else {
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return modelArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "Cell")
        let data = modelArr[indexPath.section]
        
        cell.textLabel?.text = data.subItems[indexPath.row]
        
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UINib(nibName: "TableViewSectionHeader", bundle: nil).instantiate(withOwner: nil, options: nil).last as! TableViewSectionHeader
        view.lblTitle.text = modelArr[section].sectionHeaderTitle
        let data = modelArr[section]
        if data.isHavingSubItems {
            if self.modelArr[section].isExpanded {
                view.imgView.backgroundColor = UIColor.red
            }else {
                view.imgView.backgroundColor = UIColor.green
            }
            view.imgView.isHidden = false
        }else {
            view.imgView.isHidden = true
        }
        
      
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didSelectSection(gesture:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        tapGesture.delegate = self
        
        
        view.addGestureRecognizer(tapGesture)
        view.tag = section
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = modelArr[indexPath.section]
        //        data.isExpanded = !data.isExpanded
        //        print("section: \(indexPath.section) row: \(indexPath.row)  value: \(data.subItems[indexPath.row])")
        //        if data.isHavingSubItems{
        //        self.tblView.reloadData()
        //        }
        print("row::: \(data.subItems[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    @objc func didSelectSection(gesture: UITapGestureRecognizer) {
        print(gesture.view?.tag ?? 0)
        let s = gesture.view?.tag ?? 0
        let data = modelArr[s]
        
        print("pressed on \(data.sectionHeaderTitle)")
        if data.isHavingSubItems {
            if data.isExpanded == true {
                self.modelArr[s].isExpanded = false
            }else {
                self.modelArr[s].isExpanded = true
            }
            
        }else {
            for (i, _) in modelArr.enumerated() {
                modelArr[i].isExpanded = false
            }
            
                self.closeSlideMenuBar()
             
        }
        
        tblView.reloadData()
    }
    
    func closeSlideMenuBar() {
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            SideMenuSampleVC.isClosedMenu = true
            self.view.removeFromSuperview()
            self.removeFromParent()
            
        })
    }
}
