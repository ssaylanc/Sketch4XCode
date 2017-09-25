//
//  SecondViewController.swift
//  7. TableView+PassDataWithSegue
//
//  Created by ssaylanc on 25/09/2017.
//  Copyright © 2017 ssaylanc. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var gelenData: String!
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let textData = gelenData {
            self.textLabel.text = gelenData
        }else {
            self.textLabel.text = "Data Boş Geldi!"
        }
    }
}
