//
//  NetworkingError.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 31/03/2023.
//

import Foundation

enum NetworkingError: Error {
    case request(error: Error),
         timedOut,
         invalidUrl,
         dataNotFound,
         decoded(error: Error),
         unknown(error: Error)
}
