//
//  TableViewCell.swift
//  TableView+JSONParsing
//
//  Created by ssaylanc on 26/09/2017.
//  Copyright © 2017 ssaylanc. All rights reserved.
//

import UIKit
import SwiftyJSON
import SDWebImage

class TableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var newspaperLabel: UILabel!
    @IBOutlet weak var abstractLabel: UILabel!
    @IBOutlet weak var readCount: UILabel!
    @IBOutlet weak var authorButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var favView: UIView!
    @IBOutlet weak var checkFav: UIView!
    @IBOutlet weak var shareLabel: UILabel!
    @IBOutlet weak var readLaterButton: UIButton!
    
    var readCountLabel: String!
    var title: String!
    var abstract: String!
    var tCount: Int!
    var fCount: Int!
    var totalShare: Int!
    
    var makale:JSON?{
        didSet{
            self.setupMakale()
        }
    }
    
    func setupMakale(){
        if let twitter = self.makale?["twtr"].int {
            if let facebook =  self.makale?["fb"].int {
                totalShare = twitter + facebook
                self.shareLabel.text = String(totalShare)
                self.shareLabel.accessibilityLabel = "\(String(totalShare)) adet paylaşım"
            }else{
                totalShare = twitter
                self.shareLabel.text = String(totalShare)
                self.shareLabel.accessibilityLabel = "\(String(totalShare)) adet paylaşım"
            }
        }
        
        if let twitter = self.makale?["twtr"].string {
            if let facebook =  self.makale?["fb"].string {
                totalShare = Int(twitter)! + Int(facebook)!
                self.shareLabel.text = String(totalShare)
                self.shareLabel.accessibilityLabel = "\(String(totalShare)) adet paylaşım"
            }else{
                totalShare = Int(twitter)!
                self.shareLabel.text = String(totalShare)
                self.shareLabel.accessibilityLabel = "\(String(totalShare)) adet paylaşım"
            }
        }
        
        if let tLabel = self.makale?["title"].string {
            self.titleLabel.text = tLabel
            self.title = tLabel
        }else {
            self.titleLabel.text = "Başlık Alınamadı"
        }
        
        if let aLabel = self.makale?["author_name"].string {
            self.authorLabel.text = aLabel
        }else {
            self.authorLabel.text = "?"
        }
        
        if let gazeteLabel = self.makale?["newspaper"].string  {
            self.newspaperLabel.text = "[" + gazeteLabel + "]"
        }else {
            self.newspaperLabel.text = "Gazete Adı"
        }
        
        if let absLabel = self.makale?["abstract"].string  {
            self.abstractLabel.text = absLabel
            self.abstract = absLabel
        }else{
            self.abstractLabel.text = "Makale Alınamadı!"
        }
        
        if let articleDate = self.makale?["article_date"].string  {
            self.timeLabel.text = articleDate
        }else{
            self.timeLabel.text = "Tarih!"
        }

        if let read_count = self.makale?["read_count"].int  {
            self.readCount.text = String(read_count)
            self.readCountLabel = String(read_count)
            self.readCount.accessibilityLabel = "\(String(read_count)) adet okunma"
        }
        if let rCount = self.makale?["read_count"].string {
            self.readCount.text = rCount
            self.readCount.accessibilityLabel = "\(rCount) adet okunma"
        }
        
        if let urlString = self.makale?["author_image"]{
            self.avatarImageView.sd_setImage(with: URL(string: urlString.stringValue), placeholderImage:UIImage(contentsOfFile:"default_avatar.png"))
            self.avatarImageView.layer.cornerRadius = 25
            self.avatarImageView.clipsToBounds = true
        }
        
    }
}
