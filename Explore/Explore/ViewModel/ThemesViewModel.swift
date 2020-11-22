//
//  ThemesViewModel.swift
//  Explore
//
//  Created by Amar Sawant on 22/11/20.
//  Copyright © 2020 atsawant.com. All rights reserved.
//


import Foundation

class ThemesViewModel {
    
    func numberOfOptions() -> Int {
        return Theme.allCases.count
    }
    
    func themeAtIndex(_ index: Int) -> Theme? {
        if index < Theme.allCases.count {
            return Theme.allCases[index]
        }
        return nil
    }
    
    func themeName(_ index: Int) -> String? {
        if let theme = themeAtIndex(index) {
            return theme.description
        }
        return nil
    }
    
    func imageName(_ index: Int) -> String {
        if let category = themeAtIndex(index) {
            return category.imageName
        }
        return ""
    }
}
