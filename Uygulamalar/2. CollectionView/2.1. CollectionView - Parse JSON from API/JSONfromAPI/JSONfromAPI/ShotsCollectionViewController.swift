//
//  ShotsCollectionViewController.swift
//  JSONfromAPI
//
//  Created by ssaylanc on 29/09/2017.
//  Copyright © 2017 ssaylanc. All rights reserved.
//

import UIKit
import SwiftyJSON

class ShotsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var shots: [JSON]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadShots()

    }

    func loadShots() {
        Service.sharedInstance.loadShots({ (shots) in
            if let data = shots.arrayValue as [JSON]?{
                self.shots = data
                self.collectionView?.reloadData()
                print(data)
            }
        })
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shots?.count  ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShotCell", for: indexPath) as! ShotsCollectionViewCell
    
        cell.shot = self.shots?[indexPath.row]
        
        // Configure the cell
    
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3, height: collectionView.frame.width/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // remove lines between cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }

}
