//
//  ViewController.swift
//  JSONfromAPI
//
//  Created by ssaylanc on 29/09/2017.
//  Copyright © 2017 ssaylanc. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    var shots: [JSON]? = []
    
    func loadShots() {
        Service.sharedInstance.loadShots({ (shots) in
            if let data = shots.arrayValue as [JSON]?{
                self.shots = data
                print(data)
                
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadShots()
    }

}

