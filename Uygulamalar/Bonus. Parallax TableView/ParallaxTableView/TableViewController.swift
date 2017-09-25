//
//  TableViewController.swift
//  ParallaxTableView
//
//  Created by ssaylanc on 21/08/2017.
//  Copyright © 2017 ssaylanc. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var parallaxOffsetSpeed: CGFloat = 50
    var cellHeight: CGFloat = 135
    
    var parallaxImageHeight: CGFloat {
        let maxOffset = (sqrt(pow(cellHeight, 2) + 4 * parallaxOffsetSpeed * tableView.frame.height) - cellHeight) / 2
        return cellHeight + maxOffset
    }
    
    func parallaxOffSet(newOffSetY: CGFloat, cell: UITableViewCell) -> CGFloat {
        return (newOffSetY - cell.frame.origin.y) / parallaxImageHeight * parallaxOffsetSpeed
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = tableView.contentOffset.y
        for cell in tableView.visibleCells as! [TableViewCell] {
            cell.parallaxTop.constant = parallaxOffSet(newOffSetY: offsetY, cell: cell)
            
        }
    }
    
    var models: [CellModel] = []
    
    /*var images: [UIImage] = [
        UIImage(named: "1")!,
        UIImage(named: "2")!,
        UIImage(named: "3")!,
        UIImage(named: "4")!,
        UIImage(named: "5")!
    ]*/
    
        
    override func viewDidLoad() {
        super.viewDidLoad()

        self.models.append(CellModel(title: "Title 0", imageName: "1"))
        self.models.append(CellModel(title: "Title 1", imageName: "2"))
        self.models.append(CellModel(title: "Title 2", imageName: "3"))
        self.models.append(CellModel(title: "Title 3", imageName: "4"))
        self.models.append(CellModel(title: "Title 4", imageName: "5"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.models.count * 100
    }

    func modelAtIndexPath(_ indexPath: IndexPath) -> CellModel {
        return self.models[(indexPath as NSIndexPath).row % self.models.count]
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        //cell.backgroundImage.image = images[indexPath.row]
        cell.model = self.modelAtIndexPath(indexPath)
        cell.parallaxHeight.constant = self.parallaxImageHeight
        cell.parallaxTop.constant = parallaxOffSet(newOffSetY: tableView.contentOffset.y, cell: cell)
        
        return cell
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
