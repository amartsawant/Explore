//
//  ThemeCollectionCell.swift
//  Explore
//
//  Created by Amar Sawant on 22/11/20.
//  Copyright © 2020 atsawant.com. All rights reserved.
//

import UIKit

class ThemeCollectionCell: UICollectionViewCell {
    
    lazy var container: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        view.layer.borderWidth = 0.5
        view.layer.cornerRadius = 10
        view.layer.shadowOpacity = 0.3
        view.layer.shadowRadius = 4
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy private var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.init(named: ""))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var descriptionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = ""
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configureCell() {
        self.contentView.addSubview(container)
        NSLayoutConstraint.activate([
            container.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 5),
            container.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -5),
            container.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 5),
            container.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -5)
        ])
        
        verticalStackView.addArrangedSubview(imageView)
        verticalStackView.addArrangedSubview(descriptionLabel)
        
        self.container.addSubview(self.verticalStackView)
        NSLayoutConstraint.activate([
            verticalStackView.leftAnchor.constraint(equalTo: container.safeAreaLayoutGuide.leftAnchor, constant: 5),
            verticalStackView.rightAnchor.constraint(equalTo: container.safeAreaLayoutGuide.rightAnchor, constant: -5),
            verticalStackView.topAnchor.constraint(equalTo: container.safeAreaLayoutGuide.topAnchor, constant: 5),
            verticalStackView.bottomAnchor.constraint(equalTo: container.safeAreaLayoutGuide.bottomAnchor, constant: -5)
        ])
    }
}
