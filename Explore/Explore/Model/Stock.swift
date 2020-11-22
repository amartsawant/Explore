//
//  Stock.swift
//  Explore
//
//  Created by Amar Sawant on 22/11/20.
//  Copyright © 2020 atsawant.com. All rights reserved.
//

import Foundation

struct Stocklist: Decodable {
    let topGainers: [Stock]
    let topSellers: [Stock]
}

struct Stock: Decodable {
    let id: Int
    let name: String
    let domain: String
    let quote: Float
}
