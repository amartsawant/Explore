//
//  ExploreViewController.swift
//  Explore
//
//  Created by Amar Sawant on 22/11/20.
//  Copyright © 2020 atsawant.com. All rights reserved.
//

import UIKit

fileprivate enum ExploreOption: Int {
    case category = 0
    case themes
    case trending
}

class ExploreViewController: UIViewController {
    private var currentViewController: UIViewController?
    private var selectedIndex = -1
    
    private lazy var segmentedControl: CustomSegmentedControl = {
        let control = CustomSegmentedControl(frame: CGRect.zero, buttonTitle: ["Category", "Themes", "Trending"])
        control.delegate = self
        control.translatesAutoresizingMaskIntoConstraints = false
        control.backgroundColor = .clear
        return control
    }()
    
    private lazy var containerView: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private lazy var categoryViewController: CategoryViewController = {
        var viewController = CategoryViewController()
        self.add(asChildViewController: viewController)
        return viewController
    }()
    
    private lazy var themesViewController: TheamsViewController = {
        var viewController = TheamsViewController()
        self.add(asChildViewController: viewController)
        return viewController
    }()
    
    private lazy var trendingViewController: TrendingViewController = {
        var viewController = TrendingViewController()
        self.add(asChildViewController: viewController)
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Explore"
        tabBarItem.title = nil
        // configure view components
        configureViewComponents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        if selectedIndex < 0 {
            change(to: 0)
        }
    }
    
    func configureViewComponents() {
        configureNavigationController()
        view.addSubview(segmentedControl)
        NSLayoutConstraint.activate([
            segmentedControl.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            segmentedControl.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            segmentedControl.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        view.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            containerView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 5),
            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func configureNavigationController() {
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = .white
    }
}

extension ExploreViewController {
    
    private func add(asChildViewController viewController: UIViewController) {
        currentViewController = viewController
        addChild(viewController)
        containerView.addSubview(viewController.view)
        viewController.view.frame = view.bounds
        viewController.didMove(toParent: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController?) {
        guard let viewController = viewController else { return }
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
}

extension ExploreViewController: CustomSegmentedControlDelegate {
    
    func change(to index:Int) {
        switch index {
        case ExploreOption.category.rawValue:
            debugPrint("option category selected")
            remove(asChildViewController: currentViewController)
            add(asChildViewController: categoryViewController)
            selectedIndex = index
            
        case ExploreOption.themes.rawValue:
            debugPrint("option themes selected")
            remove(asChildViewController: currentViewController)
            add(asChildViewController: themesViewController)
            selectedIndex = index
            
        case ExploreOption.trending.rawValue:
            debugPrint("option trending selected")
            remove(asChildViewController: currentViewController)
            add(asChildViewController: trendingViewController)
            selectedIndex = index
            
        default:
            debugPrint("unknown option selected")
        }
    }
    
}
