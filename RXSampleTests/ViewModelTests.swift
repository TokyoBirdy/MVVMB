//
//  RXSampleTests.swift
//  RXSampleTests
//
//  Created by ceciliah on 10/17/18.
//  Copyright © 2018 Humlan. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa

@testable import RXSample

class ViewModelTests: XCTestCase {

    var fakebackend: FakeBackend!

    var viewModel: ViewModel!


    override func setUp() {
        fakebackend = FakeBackend()
        viewModel = ViewModel(fakeBackend: fakebackend)
    }


    func testNormal() {
        let disposeBag = DisposeBag()
        let expect = expectation(description: "normalString")
        var result: String?

        let expectedresult = "dumb"
        viewModel.normalString.asObservable().skip(1).subscribe(onNext: { (str) in
            result = str
            expect.fulfill()
        }).disposed(by: disposeBag)
        //Inject somehow
            viewModel.fakeInitial(expectedresult, highlighted: "I do not care")
            waitForExpectations(timeout: 1, handler: { (error) in
                guard error == nil else {
                    XCTFail(error!.localizedDescription)
                    return
                }
            })

        XCTAssertEqual(expectedresult, result)
    }
}
