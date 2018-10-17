//
//  ViewBinderTests.swift
//  RXSampleTests
//
//  Created by ceciliah on 10/17/18.
//  Copyright © 2018 Humlan. All rights reserved.
//

import XCTest

@testable import RXSample

class ViewBinderTests: XCTestCase {

    var viewBinder: ViewBinder!

    override func setUp() {
       viewBinder = ViewBinder()
    }



    func testBindingButton() {

        let viewModel = ViewModelMock()

        let expectedString = "test normal"

        let button = UIButton.init(type: .custom)

        viewBinder.bind(button, with: viewModel)

        XCTAssertEqual(button.title(for: .normal), expectedString)

    }

}
