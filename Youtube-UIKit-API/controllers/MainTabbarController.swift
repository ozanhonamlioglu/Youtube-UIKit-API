//
//  MainTabbarController.swift
//  Youtube-UIKit-API
//
//  Created by ozan honamlioglu on 16.09.2021.
//

import UIKit

class MainTabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
        
        print("child did move")
    }
    
    // MARK: - HANDLERS
    private func setup() {
        tabBar.isHidden = true
    }

    
}
