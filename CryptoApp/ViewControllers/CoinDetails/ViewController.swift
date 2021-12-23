//
//  ViewController.swift
//  CryptoApp
//
//  Created by Martin Victory on 06/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    private var coinsDetailsView: CoinDetailsView!
    
    override func loadView() {
        let view = CoinDetailsViewImpl(coinActionsDelegate: self)
        self.coinsDetailsView = view
        self.view = view
    }
    
    override func viewDidLoad() {
        let networkService: NetworkService = NetworkServiceImpl()
        
        networkService.fetchBTCDetails { [weak self] result in
            switch result {
            case .failure:
                print("error")
            case .success(let coin):
                self?.coinsDetailsView.set(coin: coin)
            }
        }
    }

}

extension ViewController: CoinActionsDelegate {
    func buyCoin() {
        print("buy coin in controller")
    }
    
    func sellCoin() {
        print("sell coin in controller")
    }
}

