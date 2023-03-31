//
//  VersionTests.swift
//  CosmoAppTests
//
//  Created by Sofien Benharchache on 30/03/2023.
//

import XCTest
@testable import CosmoApp

final class VersionTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testValidVersion_integerOnly() throws {
        @Version var version: String
        version = "1.2.3"

        let major = $version?.major
        let minor = $version?.minor
        let patch = $version?.patch

        XCTAssertNotNil($version)
        XCTAssertNotNil(major)
        XCTAssertNotNil(minor)
        XCTAssertNotNil(patch)

        if let major { XCTAssertEqual(major, 1) }
        else { XCTFail("Fail to get major version") }

        if let minor { XCTAssertEqual(minor, 2) }
        else { XCTFail("Fail to get minor version") }

        if let patch { XCTAssertEqual(patch, 3) }
        else { XCTFail("Fail to get patch version") }
    }
    
    func testValidVersion_includingStringCharacter() throws {
        @Version var version: String
        version = "v42.23.9873b"

        let major = $version?.major
        let minor = $version?.minor
        let patch = $version?.patch

        XCTAssertNotNil($version)
        XCTAssertNotNil(major)
        XCTAssertNotNil(minor)
        XCTAssertNotNil(patch)

        if let major { XCTAssertEqual(major, 42) }
        else { XCTFail("Fail to get major version") }

        if let minor { XCTAssertEqual(minor, 23) }
        else { XCTFail("Fail to get minor version") }

        if let patch { XCTAssertEqual(patch, 9873) }
        else { XCTFail("Fail to get patch version") }
    }
    
    func testValidVersion_twoValues() throws {
        @Version var version: String
        version = "v42.23"

        let major = $version?.major
        let minor = $version?.minor
        let patch = $version?.patch

        XCTAssertNotNil($version)
        XCTAssertNotNil(major)
        XCTAssertNotNil(minor)
        XCTAssertNil(patch)
        
        if let major { XCTAssertEqual(major, 42) }
        else { XCTFail("Fail to get major version") }

        if let minor { XCTAssertEqual(minor, 23) }
        else { XCTFail("Fail to get minor version") }
    }
    
    func testValidVersion_oneValues() throws {
        @Version var version: String
        version = "v42"

        let major = $version?.major
        let minor = $version?.minor
        let patch = $version?.patch

        XCTAssertNotNil($version)
        XCTAssertNotNil(major)
        XCTAssertNil(minor)
        XCTAssertNil(patch)
        
        if let major { XCTAssertEqual(major, 42) }
        else { XCTFail("Fail to get major version") }
    }

    func testBadVersion_emptyValues() throws {
        @Version var version: String
        version = ""

        let major = $version?.major
        let minor = $version?.minor
        let patch = $version?.patch

        XCTAssertNotNil($version)
        XCTAssertNil(major)
        XCTAssertNil(minor)
        XCTAssertNil(patch)
    }
}
