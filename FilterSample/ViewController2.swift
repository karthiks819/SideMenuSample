//
//  ViewController2.swift
//  FilterSample
//
//  Created by KarthikSai on 14/12/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import UIKit
import ObjectMapper
import Alamofire


class ViewController2: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    var data =  [DataList]()
    var feedData = [ListData]()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        ServiceAPI.shared.getData(url: URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/hot-tracks/all/25/explicit.json")!, methodType: .get, parameters: [:], header: [:]) { (response) in
            switch response.result {
                
            case .success(_):
                if response.result.value != nil {
                    print("success")
                    do {
                        let responseDict = try JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as? NSMutableDictionary
                        print(responseDict?["feed"] ?? "")
                        guard let feed = responseDict?["feed"] as? [String: Any] else {return}
                        
                        if let res = feed["results"] as? NSMutableArray {
                            for case let i as [String : Any] in res  {
//                                guard let k = Mapper<DataList>().map(JSON: i ) else {return}
                               // self.data.append(k)
                            }
                        }
                        //
                        let listData = Mapper<ListData>().map(JSON: feed)
                        for i in listData!.results! {
                            self.data.append(i)
                        }
                        
                        print("*******\(self.data.count)")
                        DispatchQueue.main.async {
                            self.tblView.reloadData()
                        }
                    }catch {
                        
                    }
                }
                break
                
            case .failure(_):
                print("api call failure")
                break
                
            }
        }
    }
    
    
    
    
}



extension ViewController2: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        if !(cell != nil) {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        }
        let text = data[indexPath.row]
        cell?.textLabel?.text = text.name ?? ""
        
        
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
