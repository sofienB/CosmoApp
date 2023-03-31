//
//  DeviceTests.swift
//  CosmoAppTests
//
//  Created by Sofien Benharchache on 31/03/2023.
//

import XCTest
@testable import CosmoApp

final class DeviceTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testValidDevice_allKeys() throws {
        let jsonData = deviceJSONAllKeys.data(using: .utf8)!
        let device = try? JSONDecoder().decode(Device.self, from: jsonData)

        XCTAssertNotNil(device)
        XCTAssertEqual(device?.macAddress, "4921201e38d5")
        XCTAssertEqual(device?.model, Model.ride)
        XCTAssertEqual(device?.product, "RIDE")
        XCTAssertEqual(device?.firmwareVersion, "2.2.2")
        XCTAssertEqual(device?.serial, "BC892C9C-047D-8402-A9FD-7B2CC0048736")
        XCTAssertEqual(device?.installationMode, InstallationMode.helmet)

        XCTAssertNotNil(device?.output)
        XCTAssertEqual(device?.output?.brakeLight, false)
        XCTAssertEqual(device?.output?.lightMode, LightMode.off)
        XCTAssertEqual(device?.output?.lightAuto, false)
        XCTAssertEqual(device?.output?.lightValue, 42)

        XCTAssertNotNil(device?.$firmwareVersion)
        XCTAssertEqual(device?.$firmwareVersion?.major, 2)
        XCTAssertEqual(device?.$firmwareVersion?.minor, 2)
        XCTAssertEqual(device?.$firmwareVersion?.patch, 2)
    }

    func testValidDevice_someKeys() throws {
        let jsonData = deviceJSONSomeKeys.data(using: .utf8)!
        let device = try? JSONDecoder().decode(Device.self, from: jsonData)

        // Expected : Not nil
        XCTAssertNotNil(device)
        XCTAssertEqual(device?.macAddress, "4921201e38d5")
        XCTAssertEqual(device?.model, Model.ride)
        XCTAssertEqual(device?.firmwareVersion, "2.2.2")
        XCTAssertNotNil(device?.output)
        XCTAssertEqual(device?.output?.brakeLight, false)
        XCTAssertEqual(device?.output?.lightAuto, false)
        XCTAssertEqual(device?.output?.lightValue, 42)

        // Expected : Nil (missing keys as expected)
        XCTAssertNil(device?.serial)
        XCTAssertNil(device?.product)
        XCTAssertNil(device?.installationMode)
        XCTAssertNil(device?.product)
        XCTAssertNil(device?.output?.lightMode)
    }
    
    func testInvalidDevice_missingExpectedKeys() throws {
        let jsonData = deviceJSONMissingExpectedKeys.data(using: .utf8)!
        let device = try? JSONDecoder().decode(Device.self, from: jsonData)
        
        XCTAssertNil(device)
    }
    
    func testInvalidDevice_missingOptionalKeys() throws {
        let jsonData = deviceJSONNoOptionalKeys.data(using: .utf8)!
        let device = try? JSONDecoder().decode(Device.self, from: jsonData)
        
        XCTAssertNotNil(device)
        XCTAssertEqual(device?.macAddress, "4921201e38d5")
        XCTAssertEqual(device?.firmwareVersion, "2.2.2")

        XCTAssertNil(device?.model)
        XCTAssertNil(device?.output)
        XCTAssertNil(device?.output?.brakeLight)
        XCTAssertNil(device?.output?.lightAuto)
        XCTAssertNil(device?.output?.lightValue)
    }
}
