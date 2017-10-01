//
//  ViewController.swift
//  TableView+JSONParsing
//
//  Created by ssaylanc on 24/09/2017.
//  Copyright © 2017 ssaylanc. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    var jsonData: [JSON] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Service.sharedInstance.dosyadanOku { (gelenData) in
            print(gelenData)
        }
    }



}

