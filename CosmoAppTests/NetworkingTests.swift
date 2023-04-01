//
//  NetworkingTests.swift
//  CosmoAppTests
//
//  Created by Sofien Benharchache on 01/04/2023.
//

import XCTest
@testable import CosmoApp

import Combine
import SwiftUI

final class NetworkingTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testNetworking_Devices() throws {
        let devicesExpectation = expectation(description: "devices")
        var devices: [Device]?
        Networking.devices(completion: { response in
            switch response {
            case .success(let result):
                print("response : \(result)")
                devices = result.devices
                devicesExpectation.fulfill()
            case .failure(let error):
                print("error: \(error)")
                devicesExpectation.fulfill()
            }
        })
        
        waitForExpectations(timeout: 1) { (error) in
           XCTAssertNotNil(devices)
         }
    }
    func testNetworking_DevicesUsingCombine() throws {

        let devicesExpectation = expectation(description: "devices")
        var devices = [Device]()
        var cancellables = Set<AnyCancellable>()

        Networking.devices()
            .eraseToAnyPublisher()
            .sink { result in
                devices = result
                XCTAssertEqual(devices.count, 6)
                devicesExpectation.fulfill()
            }
            .store(in: &cancellables)

        waitForExpectations(timeout: 1) { (error) in
           XCTAssertNotNil(devices)
         }
    }
}
