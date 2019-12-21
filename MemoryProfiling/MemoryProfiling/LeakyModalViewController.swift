//
//  LeakyModalViewController.swift
//  MemoryProfiling
//
//  Created by Chaewan Park on 2019/12/21.
//  Copyright © 2019 seizze. All rights reserved.
//

import UIKit

protocol DelegatingViewDelegate {
    func delegatingMethod()
}

class DelegatingView: UIView {
    var delegate: DelegatingViewDelegate?
}

class LeakyModalViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let delegatingView = DelegatingView()
        delegatingView.delegate = self
        view.addSubview(delegatingView)
    }
    
    @IBAction func dismissModal(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    deinit {
        print("LeakyModalViewController Deinitialized")
    }
}

extension LeakyModalViewController: DelegatingViewDelegate {
    func delegatingMethod() {
        print("delegatingMethod")
    }
}
