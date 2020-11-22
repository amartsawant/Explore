//
//  TrendingViewController.swift
//  Explore
//
//  Created by Amar Sawant on 22/11/20.
//  Copyright © 2020 atsawant.com. All rights reserved.
//

import UIKit

class TrendingViewController: UIViewController {
    var viewModel: TrendingViewModel?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel = TrendingViewModel(dataHandler: DataManager())
        view.backgroundColor = .white
        configureViewComponents()
        
        reloadView()
    }
    
    func configureViewComponents() {
        tableView.register(StockTableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        let contentDiff = 80 + (self.navigationController?.navigationBar.frame.size.height ?? 0)
            + (self.tabBarController?.tabBar.frame.size.height ?? 0)
        let adjustForTabbarInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: contentDiff, right: 0)
        tableView.contentInset = adjustForTabbarInsets
        tableView.scrollIndicatorInsets = adjustForTabbarInsets
    }
    
    func reloadView() {
        viewModel?.getStocksInfo({ (stockList, error) in
            DispatchQueue.main.async {
                if let _ = error {
                    debugPrint("error in fetching data")
                    return
                }else {
                    self.tableView.reloadData()
                }
            }
        })
    }
}

extension TrendingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // handle row selection
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension TrendingViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Top Gainers"
        }else {
            return "Top Sellers"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.numberOfStocks(in: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! StockTableViewCell
        if let viewModel = viewModel {
            cell.stockImageView.image = UIImage(named: viewModel.imageNameAtIndex(indexPath.row, type: indexPath.section))
            cell.titleLabel.text = viewModel.titleAtIndex(indexPath.row, type: indexPath.section)
            cell.descriptionLabel.text = viewModel.descriptionAtIndex(indexPath.row, type: indexPath.section)
            let quote = viewModel.qouteAtIndex(indexPath.row, type: indexPath.section)
            cell.setQuote(quote: quote)
        }
        return cell
    }
}
