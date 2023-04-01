//
//  Requester.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 01/04/2023.
//

import Foundation
import Combine

protocol Requester {
    static func devices(completion: @escaping GenericResult<NetworkResult>)
    static func devices() -> AnyPublisher<[Device], Never>
}
