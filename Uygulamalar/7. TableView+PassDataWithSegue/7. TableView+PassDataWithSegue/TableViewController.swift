//
//  TableViewController.swift
//  7. TableView+PassDataWithSegue
//
//  Created by ssaylanc on 25/09/2017.
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
        
        //Bu olmazsa tabloda data oluşmaz
        self.tableView.delegate = self
        self.tableView.dataSource = self
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
    
    // Header View için başlık
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Meyveler"
    }
    
    // Tablodaki section sayısını gösterir. Default = 1
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Section içinde yer alan satır sayısını gösterir. Burası doğru gelmezse tablo oluşmaz
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appleColors.count
    }
    
    //HeaderView'in gözükmesi için bu fonksiyon gerekli
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.contentView.backgroundColor = UIColor.blue
        header.textLabel!.textColor = UIColor.white
        header.alpha = 0.2
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "TestSegue", sender: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TestSegue" {
            let toView = segue.destination as! SecondViewController
            let indexPath = sender as! IndexPath
            toView.gelenData = appleColors[indexPath.row]
        }
    }
}

