//
//  EndPointTests.swift
//  CosmoAppTests
//
//  Created by Sofien Benharchache on 01/04/2023.
//

import XCTest
@testable import CosmoApp

final class EndPointTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testEndPoint_Devices() throws {
        let devicesEndPoint: EndPoint = .devices
        XCTAssertEqual(devicesEndPoint.headerItems, [:])
        XCTAssertEqual(devicesEndPoint.path, "test/devices")
        XCTAssertEqual(devicesEndPoint.method, .GET)
        XCTAssertEqual(devicesEndPoint.queryItems, [])
    }
}
