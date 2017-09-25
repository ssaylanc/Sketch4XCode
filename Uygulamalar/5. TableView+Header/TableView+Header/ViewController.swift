//
//  ViewController.swift
//  TableView+Header
//
//  Created by ssaylanc on 25/09/2017.
//  Copyright © 2017 ssaylanc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // StoryBoard'dan tabloyu ViewController'a bağlamalıyız
    @IBOutlet weak var tableView: UITableView!
    
    // Array tipinde bir değişken oluşturup içine String atadık.
    var appleColors = ["Kırmızı", "Yeşil", "Sarı", "Koyu Kırmızı"]
    
    // Ekran açılmadan önce koşan kod, datayı burada oluştururuz.
    override func viewDidLoad() {
        super.viewDidLoad()
        //NavigationBar'ın Title'ını değiştirdik.
        self.title = "Elmalar"
        
        //Bu olmazsa tabloda data oluşmaz
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    
}

extension ViewController: UITableViewDataSource {
    
    // Cell içindeki objeleri oluşturan fonksiyon. Storyboard'da tableViewCell'i seçip "Identifier" alanına aşağıdaki "withIdentifier" daki string'i yazmalıyız. Aksi halde cell'ler eşleşmez.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    
    // Header View için başlık
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Meyveler"
    }
}

extension ViewController: UITableViewDelegate {
    
    // Tablodaki section sayısını gösterir. Default = 1
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Section içinde yer alan satır sayısını gösterir. Burası doğru gelmezse tablo oluşmaz
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appleColors.count
    }
    
    //HeaderView'in gözükmesi için bu fonksiyon gerekli
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.contentView.backgroundColor = UIColor.blue
        header.textLabel!.textColor = UIColor.white
        header.alpha = 0.2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
}

