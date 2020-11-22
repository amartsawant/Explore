//
//  PlaceholderViewController.swift
//  Explore
//
//  Created by Amar Sawant on 22/11/20.
//  Copyright © 2020 atsawant.com. All rights reserved.
//

import UIKit

class PlaceholderViewController: UIViewController {
    
    var descriptionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Placeholder screen"
        label.textColor = UIColor.lightGray.withAlphaComponent(0.5)
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
    }
    
    func configureViewComponents() {
        
        view.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            descriptionLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
