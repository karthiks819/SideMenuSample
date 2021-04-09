//
//  FilterView.swift
//  FilterSample
//
//  Created by KarthikSai on 11/09/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import UIKit
let rowValues = ["Low", "Medium", "High", "2 Players", "4 Players"]
protocol SortingTblView{
    
     func sortingMethod(data: [Int])
}

class FilterView: UIView, UITableViewDelegate, UITableViewDataSource,UIGestureRecognizerDelegate{
    @IBOutlet weak var btnApply: UIButton!
    
    var selectedRows : [String]?
    var sampleSelected:[Int]?
    @IBOutlet weak var tblView: UITableView!
    var delegate: SortingTblView!
    override func awakeFromNib() {
        self.tblView.delegate = self
        self.tblView.dataSource = self
        self.tblView.allowsSelection = false
        self.tblView.register(UINib(nibName: "FilterTableViewCell", bundle: nil), forCellReuseIdentifier: "cell2")
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapView))
        self.addGestureRecognizer(tap)
        tap.delegate = self
        tap.numberOfTapsRequired = 1
        
        btnApply.addTarget(self, action: #selector(didTapApplyBtn), for: .touchUpInside)
        self.selectedRows = [String]()
        self.sampleSelected = [Int]()
        
    }
    
    @objc func didTapApplyBtn(){
        print("applied data is \(selectedRows)")
        delegate.sortingMethod(data: sampleSelected ?? [0])
        self.removeFromSuperview()
    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view?.isDescendant(of: self.tblView) ?? false{
            return false
        }
        return true
    }

    @objc func didTapView(){
        self.removeFromSuperview()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 0
        return rowValues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as!
        FilterTableViewCell
        cell.lblTitle.text = rowValues[indexPath.row]
        cell.btnSelect.tag = indexPath.row
        cell.btnSelect.addTarget(self, action: #selector(didTapBtnInCell(sender:)), for: .touchUpInside)
    
        return cell
    }
    
    
    @objc func didTapBtnInCell(sender:UIButton){
        if !sender.isSelected{
            let val = sender.tag
            self.selectedRows?.append(rowValues[val])
            self.sampleSelected?.append(val)
            sender.isSelected = true
           //  print(sampleSelected ?? " ")
        }else{
           
            sender.isSelected = false
          
                    let ind = sampleSelected?.firstIndex(of: sender.tag)

//            print(ind!)
                        sampleSelected?.remove(at: ind ?? 0)

//            print(sampleSelected ?? " ")
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
