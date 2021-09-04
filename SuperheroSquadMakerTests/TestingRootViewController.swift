//
//  TestingRootViewController.swift
//  SuperheroSquadMakerTests
//
//  Created by Rafael Lima on 04/09/2021.
//

import UIKit

class TestingRootViewController: UIViewController {

    override func loadView() {
        let label = UILabel()
        label.text = "Running Unit Tests..."
        label.textAlignment = .center
        label.textColor = .white

        view = label
    }
}
