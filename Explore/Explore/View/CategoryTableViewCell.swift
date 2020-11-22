//
//  CategoryTableViewCell.swift
//  Explore
//
//  Created by Amar Sawant on 22/11/20.
//  Copyright © 2020 atsawant.com. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    var container: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 30
        view.layer.shadowOpacity = 0.3
        view.layer.shadowRadius = 4
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy private var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 25
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var categoryImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.init(named: "notification"))
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var imageContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25
        view.layer.borderWidth = 2.5
        view.layer.borderColor = UIColor.white.cgColor
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var descriptionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Label"
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        configureTableViewCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureTableViewCell() {
        self.contentView.addSubview(container)
        NSLayoutConstraint.activate([
            container.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 15),
            container.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -15),
            container.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
            container.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
        
        imageContainerView.addSubview(categoryImageView)
        NSLayoutConstraint.activate([
            categoryImageView.leftAnchor.constraint(equalTo: imageContainerView.safeAreaLayoutGuide.leftAnchor, constant: 5),
            categoryImageView.rightAnchor.constraint(equalTo: imageContainerView.safeAreaLayoutGuide.rightAnchor, constant: -5),
            categoryImageView.topAnchor.constraint(equalTo: imageContainerView.safeAreaLayoutGuide.topAnchor, constant: 5),
            categoryImageView.bottomAnchor.constraint(equalTo: imageContainerView.safeAreaLayoutGuide.bottomAnchor, constant: -5)
        ])
        
        self.container.addSubview(self.horizontalStackView)
        horizontalStackView.addArrangedSubview(imageContainerView)
        horizontalStackView.addArrangedSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            horizontalStackView.leftAnchor.constraint(equalTo: container.safeAreaLayoutGuide.leftAnchor, constant: 20),
            horizontalStackView.rightAnchor.constraint(equalTo: container.safeAreaLayoutGuide.rightAnchor, constant: -20),
            horizontalStackView.topAnchor.constraint(equalTo: container.safeAreaLayoutGuide.topAnchor),
            horizontalStackView.bottomAnchor.constraint(equalTo: container.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imageContainerView.heightAnchor.constraint(equalToConstant: 50),
            imageContainerView.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
}
