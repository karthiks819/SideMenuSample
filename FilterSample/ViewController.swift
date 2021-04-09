//
//  ViewController.swift
//  FilterSample
//
//  Created by KarthikSai on 11/09/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import UIKit

var dataArray:[GameData]?

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, SortingTblView {
    var mainDataArr:[GameData]!
    var filterVi: FilterView!
    var cardsArrayData:[String]?
    
    @IBOutlet weak var result: UILabel!
    
    @IBOutlet weak var tblView: UITableView!
    var spadeArray:[String]?
    var diamondArray:[String]?
    var clubsArray:[String]?
    var heartsArray:[String]?
    var jokersArray:[String]?
    var groupsArray:[String]?
    
    // s1,h9,c2,jb,d5,d7,h2,s9,c1,c13,d9,d2,s4
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardsArrayData = ["s1","h9","c2","jb","d5","d7","h2","s9","c1","c13","d9","d2","s4"]
        
        
        dataArray = [GameData]()
        mainDataArr = [GameData]()
        let gd1 = GameData(id: 167, betAmount: 25, PlayersCount: 2, CurrentPlayers: 0, status: true)
        let gd2 = GameData(id: 19, betAmount: 50, PlayersCount: 2, CurrentPlayers: 0, status: false)
        let gd3 = GameData(id: 189, betAmount: 100, PlayersCount: 2, CurrentPlayers: 0, status: false)
        let gd4 = GameData(id: 178, betAmount: 75, PlayersCount: 2, CurrentPlayers: 0, status: true)
        let gd5 = GameData(id: 190, betAmount: 125, PlayersCount: 2, CurrentPlayers: 0, status: false)
        let gd6 = GameData(id: 168, betAmount: 150, PlayersCount: 2, CurrentPlayers: 123, status: true)
        let gd7 = GameData(id: 12, betAmount: 175, PlayersCount: 2, CurrentPlayers: 0, status: false)
        let gd8 = GameData(id: 12, betAmount: 200, PlayersCount: 2, CurrentPlayers: 0, status: true)
        let gd9 = GameData(id: 12, betAmount: 225, PlayersCount: 2, CurrentPlayers: 0, status: true)
        let gd10 = GameData(id: 452, betAmount: 250, PlayersCount: 6, CurrentPlayers: 0, status: false)
        
        mainDataArr?.append(gd1)
        mainDataArr?.append(gd2)
        mainDataArr?.append(gd3)
        mainDataArr?.append(gd4)
        mainDataArr?.append(gd5)
        mainDataArr?.append(gd6)
        mainDataArr?.append(gd7)
        mainDataArr?.append(gd8)
        mainDataArr?.append(gd9)
        mainDataArr?.append(gd10)
        
        dataArray = mainDataArr
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray?.count ?? 0
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! DataCell
        
        let indexModel = dataArray?[indexPath.row]//mainDataArr?[indexPath.row]
        
        if let stat = indexModel?.status{
            cell.lblStatus.text = stat ? "open":"closed"
        }
        
        if let betAmt = indexModel?.betAmount{
            cell.lblBetAmount.text = "\(betAmt)"
        }
        
        if let playersCnt = indexModel?.PlayersCount{
            cell.lblPlayers.text = "\(playersCnt)"
        }
        
        if let currPlayers = indexModel?.CurrentPlayers{
            cell.lblPlayingCount.text = "\(currPlayers)"
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func sortingMethod(data: [Int]) {
        dataArray?.removeAll()
        print(data)
        var str = ""
        for i in data {
            
            let d  = rowValues[i]
            self.processData(str: d)
            str += "\(d) "
        }
        
        self.result.text = str
        self.tblView.reloadData()
    }
    
    func processData(str: String) {
        if str.contains("Low"){
            for i in mainDataArr! {
                if i.betAmount >= 25 && i.betAmount <= 75 {
                    dataArray?.append(i)
                }
            }
        }else if str.contains("Medium"){
            for i in mainDataArr! {
                if i.betAmount > 75 && i.betAmount <= 150 {
                    dataArray?.append(i)
                }
            }
        }else if str.contains("High"){
            for i in mainDataArr! {
                if i.betAmount > 150 {
                    dataArray?.append(i)
                }
            }
        } else if str.contains("2 Players")
        {
            for i  in mainDataArr!
            {
                if   i.PlayersCount == 2
                {
                    dataArray?.append(i)
                }
            }
        }else {
            for i in mainDataArr!
            {
                if   i.PlayersCount == 6
                {
                    dataArray?.append(i)
                }
                
            }
        }
    }
    @IBAction func btnFilterAction(_ sender: Any) {
        let myView = Bundle.main.loadNibNamed("FilterView", owner: self, options: nil)?.first

        self.filterVi = myView as? FilterView
        filterVi.delegate = self
        self.view.addSubview(filterVi)
        
    }
}

