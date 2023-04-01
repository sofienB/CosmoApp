//
//  URLSession+Extension.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 31/03/2023.
//

import Foundation

extension URLSession {
    func fetchData<T: Decodable>(for urlResquest: URLRequest, completion: @escaping (Result<T, NetworkingError>) -> Void) {
        self.dataTask(with: urlResquest) { (data, response, error) in
            guard error == nil
            else { completion(.failure(.request(error: error!))); return }
            
            guard let data
            else { completion(.failure(NetworkingError.dataNotFound)); return }
            
            Networking.decode(data: data, toType: T.self, completion)
        }.resume()
    }
}
