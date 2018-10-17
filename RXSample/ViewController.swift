//
//  ViewController.swift
//  RXSample
//
//  Created by ceciliah on 10/17/18.
//  Copyright © 2018 Humlan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button: UIButton!
    @IBOutlet var label: UILabel!

    let fakeBackend = FakeBackend()
    lazy var viewModel = ViewModel(fakeBackend:fakeBackend)
    let viewBinder = ViewBinder()
    override func viewDidLoad() {
        super.viewDidLoad()
        // funny thing, needs to set up bindings first before doing initial load, otherwise using behaviourObject
        initialLoad()
        viewBinder.bind(button, with: viewModel)
        viewBinder.bind(label, with: viewModel)
        

    }



    private func initialLoad() {
        viewModel.initialLoad()
    }


}

