//
//  ViewBinder.swift
//  RXSample
//
//  Created by ceciliah on 10/17/18.
//  Copyright © 2018 Humlan. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewBinder {

     let disposeBag = DisposeBag()

    func bind(_ button: UIButton, with viewModel:ViewModelProtocol) {
        //Two way binding 
        //set title of the button - initial from backend to view
        viewModel.normalString.debug().bind(to: button.rx.title(for: .normal)).disposed(by: disposeBag)
        viewModel.highlightedString.bind(to: button.rx.title(for: .highlighted)).disposed(by:disposeBag)
        // from view to backend
        button.rx.tap.bind(onNext:viewModel.buttonTapped).disposed(by: disposeBag)
    }

    func bind(_ label: UILabel, with viewModel:ViewModel) {
        viewModel.randomString.bind { (str) in
            label.text = str
            }.disposed(by: disposeBag)
    }


}
