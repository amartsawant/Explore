//
//  TrendingViewModel.swift
//  Explore
//
//  Created by Amar Sawant on 22/11/20.
//  Copyright © 2020 atsawant.com. All rights reserved.
//

import Foundation

enum Section: Int {
    case topGainers = 0
    case topSellers
}

enum StockType: Int, CaseIterable {
    case tesla = 0
    case pinterest
    case slack
    case linkedin
    
    public var imageName: String {
        switch self {
        case .tesla:return "tesla"
        case .slack: return "slack"
        case .pinterest: return "pinterest"
        case .linkedin: return "linkedin"
        }
    }
}

class TrendingViewModel {
    var stockList: Stocklist?
    let dataManager: DataManager
    
    init(dataHandler: DataManager) {
        self.dataManager = dataHandler
    }
    
    func numberOfStocks(in type: Int) -> Int {
        guard let stockList = stockList else { return 0 }
        
        if type == Section.topGainers.rawValue {
            return stockList.topGainers.count
        }else {
            return stockList.topSellers.count
        }
    }
    
    func stockAtIndex(_ index: Int, type: Int) -> Stock? {
        guard let stockList = stockList else { return nil }
        
        if type == Section.topGainers.rawValue {
            return stockList.topGainers[index]
        }else {
            return stockList.topSellers[index]
        }
    }
    
    func titleAtIndex(_ index: Int, type: Int) -> String? {
        if let stock = stockAtIndex(index, type: type) {
            return stock.name
        }
        return nil
    }
    
    func descriptionAtIndex(_ index: Int, type: Int) -> String? {
        if let stock = stockAtIndex(index, type: type) {
            return stock.domain
        }
        return nil
    }
    
    func qouteAtIndex(_ index: Int, type: Int) -> Float {
        if let stock = stockAtIndex(index, type: type) {
            return stock.quote
        }
        return 0
    }
    
    func imageNameAtIndex(_ index: Int, type: Int) -> String {
        if StockType.allCases.count > index {
            return StockType.allCases[index].imageName
        }
        return ""
    }
    
    func getStocksInfo(_ completion: @escaping completion) {
        dataManager.getStockListInfo { (stockList, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            if let stockList = stockList {
                self.stockList = stockList
                completion(nil, nil)
            }
        }
    }
    
}
