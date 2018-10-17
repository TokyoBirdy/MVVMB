//
//  ViewModelMock.swift
//  RXSampleTests
//
//  Created by ceciliah on 10/17/18.
//  Copyright © 2018 Humlan. All rights reserved.
//

import Foundation
import RXSample
import RxSwift

class ViewModelMock:ViewModelProtocol {
    var randomString: Observable<String> {
        return .empty()
    }

    var normalString: Observable<String> {
        return normalStringSubject
    }

    private var normalStringSubject = BehaviorSubject<String>(value: "test normal")

    var highlightedString: Observable<String> {
        return highlightedStringSubject
    }

    private var highlightedStringSubject = BehaviorSubject<String>(value: "test highlight")

    func buttonTapped() {

    }

    
}
