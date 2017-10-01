//
//  Serive.swift
//  JSONfromAPI
//
//  Created by ssaylanc on 29/09/2017.
//  Copyright © 2017 ssaylanc. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Service {
    static let sharedInstance = Service()
    var authToken: String! = ""
    var token: String! = ""
    var cacheResponse: Bool = false
    
    func loadAuthUser(_ callback: @escaping (JSON) -> Void){
        let url = "https://api.dribbble.com/v1/user"
        let parameters : [String : AnyObject] = ["access_token": Constants.access_token as AnyObject]
        Alamofire.request(url, parameters: parameters).responseJSON { response in
            guard response.result.error == nil else {
                // got an error in getting the data, need to handle it
                print("error calling GET on /posts/1")
                print(response.result.error!)
                return
            }
            if let value: AnyObject = response.result.value as AnyObject? {
                let user = JSON(value)
                callback(user)
            }
        }
    }
    
    func loadShots (/*_ list_name: String, page: Int, shotsPerPage: Int = 42,*/_ callback: @escaping (JSON) -> Void){
        let baseURL = "https://api.dribbble.com/v1/shots?access_token=\(Constants.access_token)"
        //let parameters : [String : AnyObject] = ["access_token": Constants.access_token as AnyObject, "per_page": shotsPerPage as AnyObject, "page": page as AnyObject, "list": list_name as AnyObject]
        Alamofire.request(baseURL/*, parameters: parameters*/).responseJSON { response in
            guard response.result.error == nil else {
                print("error calling GET on /posts/1")
                print(response.result.error!)
                return
            }
            if let value: AnyObject = response.result.value as AnyObject? {
                let shots = JSON(value)
                callback(shots)
            }
        }
    }
    
}
