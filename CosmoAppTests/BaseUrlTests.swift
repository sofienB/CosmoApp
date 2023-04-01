//
//  BaseUrlTests.swift
//  CosmoAppTests
//
//  Created by Sofien Benharchache on 01/04/2023.
//

import XCTest
@testable import CosmoApp

final class BaseUrlTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testBaseUrl_prod() throws {
        let prodBaseURL: BaseUrl = .prod
        XCTAssertEqual(prodBaseURL.scheme, "https")
        XCTAssertEqual(prodBaseURL.host, "cosmo-api.develop-sr3snxi-x6u2x52ooksf4.de-2.platformsh.site")
    }
}
