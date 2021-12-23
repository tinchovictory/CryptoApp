//
//  Coin.swift
//  CryptoApp
//
//  Created by Martin Victory on 21/12/2021.
//

import Foundation

struct Coin: Codable {
    var name: String
    var base: String
    var rate: Double
    
    enum CodingKeys: String, CodingKey {
        case name = "asset_id_base"
        case base = "asset_id_quote"
        case rate
    }
}
