//
//  ServiceAPI.swift
//  FilterSample
//
//  Created by KarthikSai on 14/12/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import ObjectMapper

class ServiceAPI {
    static let shared = ServiceAPI()
    private init() {}
    
    
    func getData(url:URL, methodType: HTTPMethod, parameters: [String:AnyObject]?, header: [String:String]?, completionHandler: @escaping(DataResponse<Any>) -> ()) {
        Alamofire.request(url, method: methodType, parameters: parameters, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            //print(response)
            completionHandler(response)
        }
    }
}
