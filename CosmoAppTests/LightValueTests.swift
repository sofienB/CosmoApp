//
//  LightValueTests.swift
//  CosmoAppTests
//
//  Created by Sofien Benharchache on 31/03/2023.
//

import XCTest
@testable import CosmoApp

final class LightValueTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testValidLightValue_minMaxExpected() throws {
        @LightValue(min: 0, max: 100)
        var light: Int

        light = 0
        XCTAssertNotNil(light)
        XCTAssertEqual(light, 0)
        
        light = 100
        XCTAssertEqual(light, 100)
        
        light = -1
        XCTAssertEqual(light, 0)
        
        light = 123
        XCTAssertEqual(light, 100)
    }
    
    func testValidLightValue_minMaxNotSpecified() throws {
        @LightValue
        var light: Int

        light = 0
        XCTAssertNotNil(light)
        XCTAssertEqual(light, 0)
        
        light = 100
        XCTAssertEqual(light, 100)
        
        light = -65000
        XCTAssertEqual(light, -65000)

        light = 65000
        XCTAssertEqual(light, 65000)
    }
}
