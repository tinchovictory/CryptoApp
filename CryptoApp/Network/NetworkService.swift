//
//  NetworkService.swift
//  CryptoApp
//
//  Created by Martin Victory on 21/12/2021.
//

import Foundation

protocol NetworkService {
    
    func fetchBTCDetails(completion: @escaping (Result<Coin, Error>) -> Void)
    
}
