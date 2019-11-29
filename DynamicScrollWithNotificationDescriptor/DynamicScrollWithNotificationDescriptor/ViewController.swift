//
//  ViewController.swift
//  DynamicScroll
//
//  Created by Chaewan Park on 2019/11/17.
//  Copyright © 2019 seizze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let textView1: UITextView = {
        let view = UITextView()
        return view
    }()
    
    private let textView2: UITextView = {
        let view = UITextView()
        return view
    }()
    
    private let textView3: UITextView = {
        let view = UITextView()
        return view
    }()
    
    private var notificationTokens = [NotificationToken]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let safeArea = view.safeAreaLayoutGuide
        
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(textView1)
        containerView.addSubview(textView2)
        containerView.addSubview(textView3)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        
        containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        let heightAnchor = containerView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        heightAnchor.priority = .defaultHigh
        heightAnchor.isActive = true
        
        textView1.translatesAutoresizingMaskIntoConstraints = false
        textView1.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16).isActive = true
        textView1.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16).isActive = true
        textView1.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16).isActive = true
        textView1.backgroundColor = UIColor.FlatColor.Green.ChateauGreen
        
        textView2.translatesAutoresizingMaskIntoConstraints = false
        textView2.topAnchor.constraint(equalTo: textView1.bottomAnchor, constant: 16).isActive = true
        textView2.leadingAnchor.constraint(equalTo: textView1.leadingAnchor).isActive = true
        textView2.trailingAnchor.constraint(equalTo: textView1.trailingAnchor).isActive = true
        textView2.backgroundColor = UIColor.FlatColor.Yellow.Turbo
        
        textView3.translatesAutoresizingMaskIntoConstraints = false
        textView3.topAnchor.constraint(equalTo: textView2.bottomAnchor, constant: 16).isActive = true
        textView3.leadingAnchor.constraint(equalTo: textView1.leadingAnchor).isActive = true
        textView3.trailingAnchor.constraint(equalTo: textView1.trailingAnchor).isActive = true
        textView3.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        textView3.backgroundColor = UIColor.FlatColor.Blue.Mariner
        
        textView1.heightAnchor.constraint(equalTo: textView2.heightAnchor).isActive = true
        textView2.heightAnchor.constraint(equalTo: textView3.heightAnchor).isActive = true
        
        registerKeyboardNotifications()
    }
    
    private func registerKeyboardNotifications() {
        let center = NotificationCenter.default
        
        let showToken = center.addObserver(with: UIViewController.keyboardWillShow) { (payload) in
            let contentInset = UIEdgeInsets(
                top: 0.0,
                left: 0.0,
                bottom: payload.endFrame.height,
                right: 0.0)
            self.scrollView.contentInset = contentInset
            self.scrollView.scrollIndicatorInsets = contentInset
            
            let firstResponder = UIResponder.currentFirstResponder
            
            if let textView = firstResponder as? UITextView {
                self.scrollView.scrollRectToVisible(textView.frame, animated: true)
            }
        }
        
        notificationTokens.append(showToken)
        
        let hideToken = center.addObserver(with: UIViewController.keyboardWillHide) { _ in
            let contentInset = UIEdgeInsets.zero
            self.scrollView.contentInset = contentInset
            self.scrollView.scrollIndicatorInsets = contentInset
        }
        
        notificationTokens.append(hideToken)
    }
}

