//
//  ListData.swift
//  FilterSample
//
//  Created by KarthikSai on 14/12/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class ListData: Mappable {
    var title: String?
    var country: String?
    var results: [DataList]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.title <- map["title"]
        self.country <- map["country"]
        self.results <- map["results"]
    }
    
}
