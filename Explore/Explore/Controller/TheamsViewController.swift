//
//  TheamsViewController.swift
//  Explore
//
//  Created by Amar Sawant on 22/11/20.
//  Copyright © 2020 atsawant.com. All rights reserved.
//

import UIKit

class TheamsViewController: UIViewController {
    var viewModel: ThemesViewModel?
    
    lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .white
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel = ThemesViewModel()
        configureViewComponents()
    }
    
    func configureViewComponents() {
        collectionView.register(ThemeCollectionCell.self, forCellWithReuseIdentifier: "cellIdentifier")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        let contentDiff = 80 + (self.navigationController?.navigationBar.frame.size.height ?? 0)
            + (self.tabBarController?.tabBar.frame.size.height ?? 0)
        let adjustForTabbarInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: contentDiff, right: 0)
        collectionView.contentInset = adjustForTabbarInsets
        collectionView.scrollIndicatorInsets = adjustForTabbarInsets
    }
}

extension TheamsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        debugPrint("Selected indexpath: \(indexPath)")
    }
}

extension TheamsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier", for: indexPath) as! ThemeCollectionCell
        if let viewModel = viewModel {
            cell.descriptionLabel.text = viewModel.themeName(indexPath.row)
            cell.imageView.image = UIImage(named: viewModel.imageName(indexPath.row)) 
        }
        return cell
    }
}

extension TheamsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let viewSize =  UIApplication.shared.windows.first?.bounds.size ?? CGSize.zero
        let widthHeight = (viewSize.width/2.3)
        return CGSize(width: widthHeight, height: widthHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 15, left: 15, bottom: 15, right: 15)
    }
}
