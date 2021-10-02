//
//  MainViewController.swift
//  Youtube-UIKit-API
//
//  Created by ozan honamlioglu on 16.09.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - OUTLETS
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var footerView: UIView!
    
    private lazy var mainTabbarController: UITabBarController = {
        let homeVC = HomeTableViewController()
        
        let controller = MainTabbarController()
        controller.setViewControllers([
            homeVC
        ], animated: true)
        
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupUI()
        setupTabbarController()
    }
    
    // MARK: - HANDLERS
    
    private func setupUI() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        footerView.translatesAutoresizingMaskIntoConstraints = false
        
        footerView.layer.shadowOpacity = 0.7
        footerView.layer.shadowOffset = CGSize(width: 3, height: 3)
        footerView.layer.shadowRadius = 5.0
        footerView.layer.shadowColor = UIColor.black.cgColor
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            headerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 50 + view.safeAreaInsets.top),
            footerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            footerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            footerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            footerView.heightAnchor.constraint(equalToConstant: 50 + view.safeAreaInsets.bottom),
            containerView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            containerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: footerView.topAnchor)
        ])
    }

    
    private func setupTabbarController() {
        addChild(mainTabbarController)
        mainTabbarController.didMove(toParent: self)
        
        containerView.addSubview(mainTabbarController.view)
        mainTabbarController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainTabbarController.view.topAnchor.constraint(equalTo: containerView.topAnchor),
            mainTabbarController.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            mainTabbarController.view.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            mainTabbarController.view.leftAnchor.constraint(equalTo: containerView.leftAnchor)
        ])
    }

}
