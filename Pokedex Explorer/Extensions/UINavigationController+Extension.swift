//
//  UINavigationController+Extension.swift
//  Pokedex Explorer
//
//  Created by Aaron Strickland on 15/05/2024.
//

import UIKit

// Extension to re-add swipe back functionality in views with hidden navigation bar

extension UINavigationController: UIGestureRecognizerDelegate {
    
    //handle swipe back in conversation view
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
    
    
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

