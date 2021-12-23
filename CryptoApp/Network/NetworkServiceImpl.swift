//
//  NetworkServiceImpl.swift
//  CryptoApp
//
//  Created by Martin Victory on 21/12/2021.
//

import Foundation

class NetworkServiceImpl: NetworkService {
    
    func fetchBTCDetails(completion: @escaping (Result<Coin, Error>) -> Void) {
        guard let url = buildCoinDetailsURL(for: "BTC", basedOn: "USD") else {
            print("error")
            return
        }
        
        let request = buildCoinApiRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print("error data")
                return
            }

            do {
                let coin = try JSONDecoder().decode(Coin.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(coin))
                }
            } catch let error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
    
    private func buildCoinDetailsURL(for coin: String, basedOn baseCoin: String) -> URL? {
        var compoents = URLComponents()
        compoents.scheme = "https"
        compoents.host = "rest.coinapi.io"
        compoents.path = "/v1/exchangerate/\(coin)/\(baseCoin)"
        
        return compoents.url
    }
    
    private func buildCoinApiRequest(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.addValue("20F68E44-CDE7-4816-8F98-DF49D61B271A", forHTTPHeaderField: "X-CoinAPI-Key")
        return request
    }
}
