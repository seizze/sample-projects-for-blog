//
//  RootViewController.swift
//  DynamicScrollWithNotificationDescriptor
//
//  Created by Chaewan Park on 2019/11/29.
//  Copyright © 2019 seizze. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    private let showVCButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Push TextViewController", for: .normal)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        view.addSubview(showVCButton)
        
        showVCButton.translatesAutoresizingMaskIntoConstraints = false
        showVCButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        showVCButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        showVCButton.addTarget(self, action: #selector(showTextViewController), for: .touchUpInside)
    }
    
    @objc func showTextViewController() {
        navigationController?.show(TextViewController(), sender: nil)
    }

}
