//
//  UIViewController+Extension.swift
//  CSAccessibility
//
//  Created by andre.luiz.de.souza on 22/02/19.
//  Copyright © 2019 andre.luiz.de.souza. All rights reserved.
//

import UIKit

public enum NavigationBarStyle {
    case `default`
    case colored(barColor: UIColor, tintColor: UIColor)
}

extension UIViewController {
    
    public func setupNavigationBar(with style: NavigationBarStyle, prefersLargeTitles: Bool = false) {
        
        guard let navigationController = navigationController else {
            return
        }
        
        var titleTextAttributes: [NSAttributedString.Key : Any] = [:]
        
        switch style {
        case .default:
            navigationController.navigationBar.barStyle = .default
            navigationController.navigationBar.shadowImage = nil
            navigationController.navigationBar.barTintColor = nil
            navigationController.navigationBar.tintColor = .black
            titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        case .colored(let barColor, let tintColor):
            navigationController.navigationBar.shadowImage = UIImage()
            navigationController.navigationBar.barTintColor = barColor
            navigationController.navigationBar.tintColor = tintColor
            titleTextAttributes = [NSAttributedString.Key.foregroundColor: tintColor]
        }
        
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.titleTextAttributes = titleTextAttributes
        navigationController.navigationBar.largeTitleTextAttributes = titleTextAttributes
        navigationController.navigationBar.prefersLargeTitles = prefersLargeTitles
        
    }
}
