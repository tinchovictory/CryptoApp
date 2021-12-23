//
//  CoinActions.swift
//  CryptoApp
//
//  Created by Martin Victory on 13/12/2021.
//

import UIKit

class CoinActions: UIView {
    
    private var containerStackView: UIStackView!
    private var buyButton: UIButton!
    private var sellButton: UIButton!
    
    private weak var delegate: CoinActionsDelegate?

    init(delegate: CoinActionsDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        self.backgroundColor = .backgroundGray
        
        self.containerStackView = buildContainerStackView()
        self.sellButton = buildButton("SELL", handler: #selector(handleSell), color: .red)
        self.buyButton = buildButton("BUY", handler: #selector(handleBuy), color: .green)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildContainerStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 30
        stackView.distribution = .fillEqually
        self.addSubview(stackView)
        
        return stackView
    }
    
    private func buildButton(_ title: String, handler: Selector, color: UIColor) -> UIButton {
        let button = UIButton(type: .system)
        
        button.backgroundColor = .lightGray
        button.setTitle(title, for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: handler, for: .touchUpInside)
        button.backgroundColor = color
        containerStackView.addArrangedSubview(button)
        
        return button
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            containerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            containerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            containerStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            
            buyButton.heightAnchor.constraint(equalToConstant: 50),
            sellButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc private func handleBuy() {
        delegate?.buyCoin()
    }
    
    @objc private func handleSell() {
        delegate?.sellCoin()
    }
}
