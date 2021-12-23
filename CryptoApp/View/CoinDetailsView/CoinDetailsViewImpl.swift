//
//  CoinDetailsView.swift
//  CryptoApp
//
//  Created by Martin Victory on 07/12/2021.
//

import UIKit

class CoinDetailsViewImpl: UIView, CoinDetailsView {
    
    private var coinSummary: CoinSummary!
    private var coinChart: CoinChart!
    private var coinActions: CoinActions!

    required init(coinActionsDelegate: CoinActionsDelegate) {
        super.init(frame: .zero)
        self.backgroundColor = .white
        
        initViews()
        
        coinActions = buildCoinAction(coinActionsDelegate: coinActionsDelegate)
        
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func set(coin: Coin) {
        coinSummary.setData(coin: coin)
    }
    
    private func initViews() {
        coinSummary = CoinSummary()
        self.addSubview(coinSummary)
        
        coinChart = CoinChart()
        self.addSubview(coinChart)
    }
    
    private func buildCoinAction(coinActionsDelegate: CoinActionsDelegate) -> CoinActions {
        let coinActions = CoinActions(delegate: coinActionsDelegate)
        self.addSubview(coinActions)
        return coinActions
    }
    
    private func addConstraints() {
        coinSummary.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            coinSummary.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            coinSummary.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            coinSummary.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
        
        coinChart.translatesAutoresizingMaskIntoConstraints = false
        let charHeight = coinChart.heightAnchor.constraint(equalToConstant: 300)
        charHeight.priority = UILayoutPriority(999)
        NSLayoutConstraint.activate([
            coinChart.topAnchor.constraint(equalTo: coinSummary.bottomAnchor, constant: 30),
            coinChart.leadingAnchor.constraint(equalTo: coinSummary.leadingAnchor),
            coinChart.trailingAnchor.constraint(equalTo: coinSummary.trailingAnchor),
            charHeight
        ])
        
        coinActions.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            coinActions.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            coinActions.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            coinActions.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
