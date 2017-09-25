//
//  TableViewController.swift
//  TableView+CustomCell
//
//  Created by ssaylanc on 24/09/2017.
//  Copyright © 2017 ssaylanc. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    // Array tipinde bir değişken oluşturup içine String atadık.
    var appleColors = ["Kırmızı", "Yeşil", "Sarı", "Koyu Kırmızı"]
    
    // Ekran açılmadan önce koşan kod, datayı burada oluştururuz.
    override func viewDidLoad() {
        super.viewDidLoad()
        //NavigationBar'ın Title'ını değiştirdik.
        self.title = "Elmalar"
    }
    
    // Tablodaki section sayısını gösterir. Default = 1
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Section içinde yer alan satır sayısını gösterir. Burası doğru gelmezse tablo oluşmaz
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appleColors.count
    }
    
    // Cell içindeki objeleri oluşturan fonksiyon. Storyboard'da tableViewCell'i seçip "Identifier" alanına aşağıdaki "withIdentifier" daki string'i yazmalıyız. Aksi halde cell'ler eşleşmez.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! TableViewCell
        
        //Cell'deki objeleri data verdik.
        cell.colorLabel.text = appleColors[indexPath.row]
        cell.iconImageView.image = UIImage(named: "apple")
        //Cell içindeki objeleri buradan ayarlayabiliriz.
        cell.iconImageView.layer.borderColor = UIColor.black.cgColor
        cell.iconImageView.layer.borderWidth = 1
        cell.iconImageView.layer.cornerRadius = 25
        cell.iconImageView.clipsToBounds = true
        
        return cell
    }
}

