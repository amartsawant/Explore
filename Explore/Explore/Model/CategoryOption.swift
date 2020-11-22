//
//  CategoryOption.swift
//  Explore
//
//  Created by Amar Sawant on 22/11/20.
//  Copyright © 2020 atsawant.com. All rights reserved.
//

import Foundation

enum CategoryOption: Int, CaseIterable {
    case stocks = 0
    case ETF
    case crypto
    
    public var imageName: String {
        switch self {
        case .stocks:return "stocks"
        case .ETF: return "etf"
        case .crypto: return "crypto"
        }
    }
    
    public var description: String {
        switch self {
        case .stocks:return "Stocks"
        case .ETF: return "ETFs"
        case .crypto: return "Crypto"
        }
    }
}
