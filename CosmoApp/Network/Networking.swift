//
//  Networking.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 31/03/2023.
//

import Foundation

typealias GenericResult<T: Decodable> = (Result<T, NetworkingError>) -> ()

// MARK: - Networking
struct Networking {
    
    static let baseURL: BaseUrl = .prod
    static let timeoutInterval = 60.0 // By default 60 seconds.

    // MARK: - urlResquest from endPoint
    static func urlResquest(from endPoint: EndPoint) -> URLRequest? {
        var components = URLComponents()
        components.scheme = Networking.baseURL.scheme
        components.host = Networking.baseURL.host
        components.path = endPoint.path
        components.queryItems =  endPoint.queryItems
        
        guard let url = components.url else { return nil }

        return URLRequest(url: url,
                          cachePolicy: .reloadIgnoringLocalCacheData,
                          timeoutInterval: timeoutInterval)
    }
    
    // MARK: - decode data

    /// Decode data
    ///
    /// Decode from json data.
    /// If an error occured a Networking Error is catched and passing into result completion.
    ///
    /// - Parameter data : Data json to decode.
    /// - Parameter toType : Expected type to decode.
    /// - Parameter completion : Result of decoded data. Can be succeded or failed with NetworkingError.
    static func decode<T: Decodable>(data: Data, toType: T.Type, _ completion: @escaping GenericResult<T>) {
        do {
            let data = try JSONDecoder().decode(T.self, from: data)
            completion(.success(data))
        } catch {
            completion(.failure(NetworkingError.decoded(error: error)))
        }
    }
    
    // MARK: - fetch endPoint
    static func fetch<T: Any>(endPoint: EndPoint, _ completion: @escaping GenericResult<T>) {
        guard let urlResquest = urlResquest(from: endPoint) else {
            completion(.failure(.invalidUrl))
            return
        }
        URLSession.shared.fetchData(for: urlResquest, completion: completion)
    }
}
