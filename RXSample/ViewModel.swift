//
//  ViewModel.swift
//  RXSample
//
//  Created by ceciliah on 10/17/18.
//  Copyright © 2018 Humlan. All rights reserved.
//

import Foundation
import RxSwift

public protocol ViewModelProtocol {
    var randomString:Observable<String> { get }
    var normalString:Observable<String> { get }
    var highlightedString: Observable<String> { get }
    func buttonTapped()
}

class ViewModel:ViewModelProtocol {
    let fakeBackend:FakeBackend
    var randomString:Observable<String> {
        return randomStringSubject
    }

    var normalString:Observable<String> {
        return normalStringSubject
    }

    var highlightedString: Observable<String> {
        return highlightedStringSubject
    }

    //an observable class implementation
    private var randomStringSubject = PublishSubject<String>()

    private var normalStringSubject = BehaviorSubject<String>(value: "fake")

    private var highlightedStringSubject = BehaviorSubject<String>(value: "fakeHigh")

    init(fakeBackend:FakeBackend) {
        self.fakeBackend = fakeBackend
        self.fakeBackend.delegate = self
    }

    func initialLoad() {
        fakeBackend.initialsetup()
    }

    func buttonTapped() {
        fakeBackend.generateRandomNumber()
    }
}

extension ViewModel: FakeBackendDelegate {
    func fakecallback(_ randomNum: Int) {
        randomStringSubject.onNext(String(randomNum))
    }

    func fakeInitial(_ normal: String, highlighted: String) {
        normalStringSubject.onNext(normal)
        highlightedStringSubject.onNext(highlighted)
    }
    
}
