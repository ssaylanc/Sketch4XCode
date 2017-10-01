//
//  ViewController.swift
//  7. TableView+CoreData
//
//  Created by ssaylanc on 25/09/2017.
//  Copyright © 2017 ssaylanc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var arabalar: [Arabalar] = []
    var isDescriptionViewVisible: Bool = false

    @IBOutlet weak var arkaView: UIView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var modelTextLabel: UITextField!
    @IBOutlet weak var renkTextLabel: UITextField!
    @IBOutlet weak var yilTextLabel: UITextField!
    @IBOutlet weak var ekleButton: UIButton!
    @IBOutlet weak var listButton: UIButton!
    
    @IBAction func tableButtonDidTouch(_ sender: Any) {
        performSegue(withIdentifier: "TableSegue", sender: nil)
    }
    
    @IBAction func ekleButtonTouched(_ sender: Any) {
        
        //Textbox'lar boş mu kontrol et
        if textboxBosmu() {
            self.alertError()

        }else {
            // Core Data'ya kaydet
            let araba = Arabalar(context: context)
            araba.model = modelTextLabel.text!
            araba.renk = renkTextLabel.text!
            araba.yil = Int64(yilTextLabel.text!)!
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            //self.flipView()
            self.alert()
            
        }
    }
    // 1. yol Textfield dışındaki alanlara dokununca keyboard'u kapat
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        view.endEditing(true)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modelTextLabel.returnKeyType = .done

    }

    // 2. yol extfield dışındaki alanlara dokununca keyboard'u kapat
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        modelTextLabel.resignFirstResponder()
        renkTextLabel.resignFirstResponder()
        yilTextLabel.resignFirstResponder()
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.getCoreData()
        self.setupUI()
    }
    
    func textboxBosmu() -> Bool{
        if (modelTextLabel.text?.isEmpty)! && (yilTextLabel.text?.isEmpty)! && (renkTextLabel.text?.isEmpty)! {
            return true
        }else {return false}
    }
    
    func setupUI() {
        
        // Corner radius
        self.cardView.layer.cornerRadius = 12
        
        // 1- Aşağıdaki gibi gölge oluşturmak performansı etkiler. Çünkü iOS view'in şekline
        // göre gölgeyi "dinamik" olarak çizmeye çalışır. 2. metodu eklemek fayda sağlar
        self.cardView.layer.shadowColor = UIColor.lightGray.cgColor
        self.cardView.layer.shadowOpacity = 1
        self.cardView.layer.shadowOffset = CGSize.zero
        self.cardView.layer.shadowRadius = 10
        
        // 2- Aşağıdaki gibi bir Shadow Path oluşturabiliriz.
        self.cardView.layer.shadowPath = UIBezierPath(rect: self.cardView.bounds).cgPath
        // Gölgeyi cachlersek her seferinde tekrar çizmeye gerek kalmaz.
        self.cardView.layer.shouldRasterize = true
        
        self.arkaView.isHidden = true
        self.cardView.isHidden = false
        self.ekleButton.layer.borderWidth = 1
        self.ekleButton.layer.borderColor = UIColor.blue.cgColor
        self.ekleButton.layer.cornerRadius = 8
        self.listButton.layer.borderWidth = 1
        self.listButton.layer.borderColor = UIColor.white.cgColor
        self.listButton.layer.cornerRadius = 8
    }
    
    func getCoreData() {
        do {
            arabalar = try context.fetch(Arabalar.fetchRequest())
        }
        catch {
            print("CoreData okunamadı")
        }
    }
    
    func alertError() {
        let alert = UIAlertController(title: "Hata", message: "TextField Boş!", preferredStyle: .alert)
        let action1 = UIAlertAction(title: NSLocalizedString("Tamam", comment: "Default action"), style: .`default`, handler: { _ in
        })
        alert.addAction(action1)
        self.present(alert, animated: true, completion: nil)
    }
    
    func alert() {
        let alert = UIAlertController(title: "Bilgi", message: "Veri Eklendi.", preferredStyle: .alert)
        let action1 = UIAlertAction(title: NSLocalizedString("Tamam", comment: "Default action"), style: .`default`, handler: { _ in
        })
        
        let action2 = UIAlertAction(title: NSLocalizedString("İptal", comment: "Default action"), style: .`default`, handler: { _ in
        })
        
        alert.addAction(action1)
        alert.addAction(action2)
        self.present(alert, animated: true, completion: nil)
        
    }
    func flipView() {
        if isDescriptionViewVisible == false {
            self.arkaView.isHidden = true
            self.isDescriptionViewVisible = true
            UIView.transition(from: cardView, to: arkaView , duration: 0.65, options: [UIViewAnimationOptions.transitionFlipFromRight, UIViewAnimationOptions.showHideTransitionViews], completion: nil)
        }else{
            self.isDescriptionViewVisible = false
            UIView.transition(from: arkaView, to: cardView , duration: 0.65, options: [UIViewAnimationOptions.transitionFlipFromRight, UIViewAnimationOptions.showHideTransitionViews], completion: nil)
        }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TableSegue" {
//            let toView = segue.destination as! TableViewController
//            let indexPAth = sender as! IndexPath
//            guard let shotID = self.shots?[indexPath.row]["id"].int else {return}
//            toView.shotID = shotID
        }
        
        //bir sonraki ekranda backbutton text'ini sildik
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }
}

