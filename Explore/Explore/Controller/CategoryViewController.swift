//
//  CategoryViewController.swift
//  Explore
//
//  Created by Amar Sawant on 22/11/20.
//  Copyright © 2020 atsawant.com. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    var viewModel: CategoryViewModel?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel = CategoryViewModel()
        view.backgroundColor = .white
        configureViewComponents()
    }
    
    func configureViewComponents() {
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        let contentDiff = 80 + (self.navigationController?.navigationBar.frame.size.height ?? 0)
            + (self.tabBarController?.tabBar.frame.size.height ?? 0)
        let adjustForTabbarInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: contentDiff, right: 0)
        tableView.contentInset = adjustForTabbarInsets
        tableView.scrollIndicatorInsets = adjustForTabbarInsets
    }
    
    func bgColorForOption(_ index: Int) -> UIColor {
        switch index {
        case  CategoryOption.stocks.rawValue:
            return UIColor(rgb: 0xA5A4FD)
        case  CategoryOption.ETF.rawValue:
            return UIColor(rgb: 0x4E4FCF)
        case  CategoryOption.crypto.rawValue:
            return UIColor(rgb: 0xFED73D)
        default:
            return UIColor.gray.withAlphaComponent(0.3)
        }
    }
}

extension CategoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // handle row selection
        debugPrint("index path selected :\(indexPath)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfOptions() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! CategoryTableViewCell
        if let viewModel = viewModel {
            let image =  UIImage(named: viewModel.imageName(indexPath.row))
            cell.categoryImageView.image = image?.withRenderingMode(.alwaysTemplate)
            cell.categoryImageView.tintColor = .white
            cell.descriptionLabel.text = viewModel.categoryName(indexPath.row)
            cell.container.backgroundColor = bgColorForOption(indexPath.row)
        }
        return cell
    }
}
