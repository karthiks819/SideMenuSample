//
//  DataList.swift
//  FilterSample
//
//  Created by KarthikSai on 14/12/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
//Results

class DataList: Mappable {
    
    
    var name: String?
    var id: String?
    var kind: String?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.name <- map["name"]
        self.id <- map["id"]
        self.kind <- map["kind"]
    }
}
