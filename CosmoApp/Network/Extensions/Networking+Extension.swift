//
//  Networking+Extension.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 31/03/2023.
//

import Foundation
import Combine

extension Networking: Requester {
    
    /// GET : Devices
    static func devices(completion: @escaping GenericResult<NetworkResult>) {
        let endPoint: EndPoint = .devices
        Networking.fetch(endPoint: endPoint, completion)
    }
}

// MARK: - Using Async
extension Networking {
    
    /// GET : Devices
    static func devices() async throws -> [Device] {
        let endPoint: EndPoint = .devices
        guard let urlResquest = Networking.urlResquest(from: endPoint)?.url else {
            return []
        }
        
        let (data, response) = try await URLSession.shared.data(from: urlResquest)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200
        else { throw NetworkingError.dataNotFound }
        
        let decodedData = try JSONDecoder().decode(NetworkResult.self, from: data)
        return decodedData.devices ?? []
    }
}

// MARK: - Using Combine
extension Networking {
    
    /// GET : Devices
    static func devices() -> AnyPublisher<[Device], Never> {
        let endPoint: EndPoint = .devices
        guard let urlResquest = Networking.urlResquest(from: endPoint) else {
            return Just([]).eraseToAnyPublisher()
        }
      
      return URLSession.shared.dataTaskPublisher(for: urlResquest)
        .map(\.data)
        .decode(type: NetworkResult.self, decoder: JSONDecoder())
        .receive(on: DispatchQueue.main)
        .map {
            guard let devices = $0.devices else { return [] }
            return devices
        }
        .replaceError(with: [])
        .eraseToAnyPublisher()
    }
}
