//
//  FinalViewController.swift
//  ConatainerController
//
//  Created by Admin on 08/10/22.
//

import UIKit

class SessionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Sessions View Controller Will Appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Sessions View Controller Will Disappear")
    }
}
