//
//  NetworkResultTests.swift
//  CosmoAppTests
//
//  Created by Sofien Benharchache on 31/03/2023.
//

import XCTest
@testable import CosmoApp

final class NetworkResultTests: XCTestCase {

    override func setUpWithError() throws { }
    override func tearDownWithError() throws { }

    func testValidNetworkResult() throws {
        let jsonData = devicesJSON.data(using: .utf8)!
        let result = try? JSONDecoder().decode(NetworkResult.self, from: jsonData)

        XCTAssertNotNil(result)
        XCTAssertEqual(result?.devices?.count, 6)
        
        guard let firstDevice = result?.devices?.first,
              let lastDevice = result?.devices?.last
        else {
            XCTFail("Error : first device result shouldn't be nil")
            return
        }
        // First
        XCTAssertEqual(firstDevice.macAddress, "4921201e38d5")
        XCTAssertEqual(firstDevice.model, Model.ride)
        XCTAssertEqual(firstDevice.product, "RIDE")
        XCTAssertEqual(firstDevice.firmwareVersion, "2.2.2")
        XCTAssertEqual(firstDevice.serial, "BC892C9C-047D-8402-A9FD-7B2CC0048736")
        XCTAssertEqual(firstDevice.installationMode, InstallationMode.helmet)

        XCTAssertNotNil(firstDevice.output)
        XCTAssertEqual(firstDevice.output?.brakeLight, false)
        XCTAssertEqual(firstDevice.output?.lightMode, LightMode.off)
        XCTAssertEqual(firstDevice.output?.lightAuto, false)
        XCTAssertEqual(firstDevice.output?.lightValue, 0)

        XCTAssertNotNil(firstDevice.$firmwareVersion)
        XCTAssertEqual(firstDevice.$firmwareVersion?.major, 2)
        XCTAssertEqual(firstDevice.$firmwareVersion?.minor, 2)
        XCTAssertEqual(firstDevice.$firmwareVersion?.patch, 2)
        
        // Last
        XCTAssertEqual(lastDevice.macAddress, "D2:7B:0F:ED:82:F7")
        XCTAssertEqual(lastDevice.model, Model.remote)
        XCTAssertEqual(lastDevice.product, "REMOTE_V1")
        XCTAssertEqual(lastDevice.firmwareVersion, "1.3.1")
        XCTAssertEqual(lastDevice.installationMode, InstallationMode.helmet)
        XCTAssertNil(lastDevice.serial)

        XCTAssertNotNil(lastDevice.output)
        XCTAssertEqual(lastDevice.output?.brakeLight, false)
        XCTAssertEqual(lastDevice.output?.lightAuto, false)
        XCTAssertEqual(lastDevice.output?.lightValue, 0)
        XCTAssertNil(lastDevice.output?.lightMode)

        XCTAssertNotNil(lastDevice.$firmwareVersion)
        XCTAssertEqual(lastDevice.$firmwareVersion?.major, 1)
        XCTAssertEqual(lastDevice.$firmwareVersion?.minor, 3)
        XCTAssertEqual(lastDevice.$firmwareVersion?.patch, 1)
    }
}
