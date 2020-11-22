//
//  StockTableViewCell.swift
//  Explore
//
//  Created by Amar Sawant on 22/11/20.
//  Copyright © 2020 atsawant.com. All rights reserved.
//

import UIKit

class StockTableViewCell: UITableViewCell {
    
    var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy private var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy private var titleStackView: UIStackView = {
           let stackView = UIStackView()
           stackView.distribution = .fill
           stackView.axis = .vertical
           stackView.alignment = .leading
           stackView.spacing = 5
           stackView.translatesAutoresizingMaskIntoConstraints = false
           return stackView
       }()
    
    lazy private var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 1
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var stockImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.init(named: "notification"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var stockQuoteView: UIView = {
        let quoteView = UIView()
        quoteView.backgroundColor = .green
        quoteView.layer.cornerRadius = 10
        quoteView.layer.shadowOpacity = 0.3
        quoteView.layer.shadowRadius = 4
        quoteView.layer.shadowOffset = CGSize(width: 0, height: 0)
        quoteView.translatesAutoresizingMaskIntoConstraints = false
        return quoteView
    }()
    
    var quoteLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Label"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Label"
        label.textAlignment = .left
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var descriptionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textAlignment = .left
        label.text = "Label"
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
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
            container.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 5),
            container.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -5),
            container.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
            container.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
        
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(descriptionLabel)
        titleStackView.addArrangedSubview(verticalStackView)

        stockQuoteView.addSubview(quoteLabel)
        NSLayoutConstraint.activate([
            quoteLabel.leftAnchor.constraint(equalTo: stockQuoteView.leftAnchor, constant: 5),
            quoteLabel.rightAnchor.constraint(equalTo: stockQuoteView.rightAnchor, constant: -5),
            quoteLabel.topAnchor.constraint(equalTo: stockQuoteView.topAnchor, constant: 5),
            quoteLabel.bottomAnchor.constraint(equalTo: stockQuoteView.bottomAnchor, constant: -5),
            
            quoteLabel.widthAnchor.constraint(equalToConstant: 70)

        ])
        
        horizontalStackView.addArrangedSubview(stockImageView)
        horizontalStackView.addArrangedSubview(titleStackView)
        horizontalStackView.addArrangedSubview(stockQuoteView)

        container.addSubview(self.horizontalStackView)
        NSLayoutConstraint.activate([
            horizontalStackView.leftAnchor.constraint(equalTo: container.safeAreaLayoutGuide.leftAnchor, constant: 20),
            horizontalStackView.rightAnchor.constraint(equalTo: container.safeAreaLayoutGuide.rightAnchor, constant: -20),
            horizontalStackView.topAnchor.constraint(equalTo: container.safeAreaLayoutGuide.topAnchor),
            horizontalStackView.bottomAnchor.constraint(equalTo: container.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stockImageView.heightAnchor.constraint(equalToConstant: 45),
            stockImageView.widthAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    func setQuote(quote: Float) {
        quoteLabel.text = String(quote) + "%"
        if quote < 0 {
            stockQuoteView.backgroundColor = UIColor(rgb: 0xFD6A6B)
        }else {
            stockQuoteView.backgroundColor = UIColor(rgb: 0x3FDBB4)
        }
    }
}
