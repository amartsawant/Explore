//
//  CategoryViewModel.swift
//  Explore
//
//  Created by Amar Sawant on 22/11/20.
//  Copyright © 2020 atsawant.com. All rights reserved.
//

import Foundation

class CategoryViewModel {
    
    func numberOfOptions() -> Int {
        return CategoryOption.allCases.count
    }
    
    func categoryAtIndex(_ index: Int) -> CategoryOption? {
        if index < CategoryOption.allCases.count {
            return CategoryOption.allCases[index]
        }
        return nil
    }
    
    func categoryName(_ index: Int) -> String? {
        if let category = categoryAtIndex(index) {
            return category.description
        }
        return nil
    }
    
    func imageName(_ index: Int) -> String {
        if let category = categoryAtIndex(index) {
            return category.imageName
        }
        return ""
    }
}
