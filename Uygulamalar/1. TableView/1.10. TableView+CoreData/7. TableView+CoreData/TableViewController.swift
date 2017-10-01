//
//  TableViewController.swift
//  7. TableView+CoreData
//
//  Created by ssaylanc on 28/09/2017.
//  Copyright © 2017 ssaylanc. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController, UITextFieldDelegate {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var arabalar: [Arabalar] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getCoreData()
        self.setupNavbar()

    }
    
    
    func setupNavbar() {
        self.title = "Arama"
        
    }

    func getCoreData() {
        do {
            arabalar = try context.fetch(Arabalar.fetchRequest())        }
        catch {
            print("Core Data okunamadı")
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arabalar.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! TableViewCell

        cell.arabaModelLabel.text = arabalar[indexPath.row].model
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let araba = arabalar[indexPath.row]
            context.delete(araba)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                arabalar = try context.fetch(Arabalar.fetchRequest())
            }
            catch {
                print("Fetch Başarısız")
            }
        }
        tableView.reloadData()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
