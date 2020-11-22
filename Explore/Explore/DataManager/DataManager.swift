//
//  DataManager.swift
//  Explore
//
//  Created by Amar Sawant on 22/11/20.
//  Copyright © 2020 atsawant.com. All rights reserved.
//

import Foundation

typealias completion = ((Stocklist?, Error?) -> Void)

class DataManager {
    
    func getStockListInfo(_ completion: completion) {
        loadJsonData(filename: "stocks") { (stockList, error) in
            completion(stockList, error)
        }
    }
}

extension DataManager {
    
    func loadJsonData(filename fileName: String, completion: completion) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let places = try decoder.decode(Stocklist.self, from: data)
                completion(places, nil)
            }catch {
                debugPrint("error:\(error)")
                completion(nil, error)
            }
        }
    }
}
