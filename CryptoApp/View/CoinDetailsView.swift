//
//  CoinDetailsView.swift
//  CryptoApp
//
//  Created by Martin Victory on 21/12/2021.
//

import Foundation

protocol CoinDetailsView {
    init(coinActionsDelegate: CoinActionsDelegate)
    
    func set(coin: Coin)
}
