//
//  Service.swift
//  TableView+JSONParsing
//
//  Created by ssaylanc on 26/09/2017.
//  Copyright © 2017 ssaylanc. All rights reserved.
//

import Foundation
import SwiftyJSON

class Service {
    
    static let sharedInstance = Service()
    
    public func dosyadanOku(_ callback: @escaping (JSON) -> Void){
        var jsonObj: JSON!
        if let path : String = Bundle.main.path(forResource: "/articles", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                do {
                    jsonObj = try JSON(data: data)
                    print("jsonData:\(jsonObj)")
                    callback(jsonObj)
                } catch _ {
                    jsonObj = nil
                    print("Dosyadan json verisini alamadım, dosyada json datası olduğundan emin ol!")
                }
            } catch let error {
                print(error.localizedDescription)
            }
        } else {
            print("dosya lokasyonu hatalı!.")
        }
    }
}

        
       

