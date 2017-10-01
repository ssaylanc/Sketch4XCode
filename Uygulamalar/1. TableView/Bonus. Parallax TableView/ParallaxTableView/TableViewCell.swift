//
//  TableViewCell.swift
//  ParallaxTableView
//
//  Created by ssaylanc on 21/08/2017.
//  Copyright © 2017 ssaylanc. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var parallaxTop: NSLayoutConstraint!
    @IBOutlet weak var parallaxHeight: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundImage.clipsToBounds = true
    }

    var model: CellModel! {
        didSet {
            self.updateView()
        }
    }

    func updateView() {
        self.backgroundImage.image = UIImage(named:self.model.imageName)
        self.titleLabel.text = self.model.title
    }

}
