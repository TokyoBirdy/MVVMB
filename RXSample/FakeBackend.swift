//
//  FakeBackend.swift
//  RXSample
//
//  Created by ceciliah on 10/17/18.
//  Copyright © 2018 Humlan. All rights reserved.
//

import Foundation

protocol FakeBackendDelegate: class {
    func fakecallback(_ randomNum: Int)
    func fakeInitial(_ normal: String, highlighted: String)
}

class FakeBackend {

    weak var delegate:FakeBackendDelegate?

    var normalState:String = ""
    var highlightedState:String = ""

    var randomNum: Int = 0 {
        didSet {
            delegate?.fakecallback(randomNum)
        }
    }

    func initialsetup() {
        self.delegate?.fakeInitial("normal", highlighted: "highlighted")
    }

    func generateRandomNumber() {
        randomNum = Int.random(in: 0...100)
    }
}
