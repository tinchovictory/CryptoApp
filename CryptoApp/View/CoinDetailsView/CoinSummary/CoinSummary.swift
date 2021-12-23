//
//  CoinSummary.swift
//  CryptoApp
//
//  Created by Martin Victory on 07/12/2021.
//

import UIKit

class CoinSummary: UIView {
    
    private var coinImg: UIImageView!
    private var coinNameLbl: UILabel!
    private var defaultCurrencyLbl: UILabel!
    private var coinValue: UILabel!

    init() {
        super.init(frame: .zero)
        self.backgroundColor = .backgroundGray
        self.layer.cornerRadius = 5
        
        // setup subviews
        coinImg = self.buildCoinImage()
        coinNameLbl = self.buildCoinNameLbl()
        defaultCurrencyLbl = self.buildDefaultCurrencyLbl()
        coinValue = self.buildCoinValueLbl()
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setData(coin: Coin) {
        coinNameLbl.text = coin.name
        defaultCurrencyLbl.text = coin.base
        coinValue.text = String(format: "%.2f", coin.rate)
    }
   
    private func buildCoinImage() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "btcLogo")
        self.addSubview(imageView)
        
        return imageView
    }
    
    private func buildCoinNameLbl() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bitcoin"
        label.textColor = .textSecondary
        self.addSubview(label)
        
        return label
    }
    
    private func buildDefaultCurrencyLbl() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "USD"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .textSecondary
        self.addSubview(label)
        
        return label
    }
    
    private func buildCoinValueLbl() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "49,200.00"
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        label.textColor = .textPrimary
        self.addSubview(label)
        
        return label
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            coinImg.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
//            coinImg.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            coinImg.heightAnchor.constraint(equalToConstant: 50),
            coinImg.widthAnchor.constraint(equalTo: coinImg.heightAnchor),
            coinImg.centerYAnchor.constraint(equalTo: coinNameLbl.centerYAnchor),
            
            coinNameLbl.leadingAnchor.constraint(equalTo: coinImg.trailingAnchor),
            coinNameLbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            coinNameLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            
            coinValue.topAnchor.constraint(equalTo: coinNameLbl.bottomAnchor, constant: 10),
            coinValue.trailingAnchor.constraint(equalTo: coinNameLbl.trailingAnchor),
            coinValue.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            
            defaultCurrencyLbl.bottomAnchor.constraint(equalTo: coinValue.bottomAnchor),
            defaultCurrencyLbl.trailingAnchor.constraint(equalTo: coinValue.leadingAnchor, constant: -5),
        ])
    }
}
