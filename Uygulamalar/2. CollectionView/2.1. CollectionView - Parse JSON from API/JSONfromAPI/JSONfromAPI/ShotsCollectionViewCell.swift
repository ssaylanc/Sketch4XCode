//
//  ShotsCollectionViewCell.swift
//  JSONfromAPI
//
//  Created by ssaylanc on 29/09/2017.
//  Copyright © 2017 ssaylanc. All rights reserved.
//

import UIKit
import SwiftyJSON
import SDWebImage

class ShotsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var shotImage: UIImageView!
    
    var shot:JSON?{
        didSet{
            self.setupShot()
        }
    }
    
    func setupShot() {
         if let urlString = self.shot?["images"]["teaser"]{
            self.shotImage.sd_setImage(with: URL(string: urlString.stringValue), placeholderImage:UIImage(contentsOfFile:"placeholder.png"))
            self.shotImage.layer.cornerRadius = 5
            self.shotImage.clipsToBounds = true
        }
        
    }
}
