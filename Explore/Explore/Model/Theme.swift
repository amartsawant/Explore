//
//  Theme.swift
//  Explore
//
//  Created by Amar Sawant on 22/11/20.
//  Copyright © 2020 atsawant.com. All rights reserved.
//

import Foundation

enum Theme: Int, CaseIterable {
    case diversity = 0
    case bio
    case crypto
    case she
    case green
    case cannabis
    case powerit
    case foodie
    case art
    case home
    
    public var imageName: String {
        switch self {
        case .diversity:return "diversity"
        case .bio: return "bio"
        case .crypto: return "crypto1"
        case .she:return "woman"
        case .green: return "green"
        case .cannabis: return "cannabis"
        case .powerit:return "power"
        case .foodie: return "foodie"
        case .art: return "fashion"
        case .home: return "home"
        }
    }
    
    public var description: String {
        switch self {
        case .diversity:return "Diversity & Inclusion"
        case .bio: return "Bold Biotech"
        case .crypto: return "Crypto Central"
        case .she:return "She runs it"
        case .green: return "Clean & Green"
        case .cannabis: return "Cannabis-ness"
        case .powerit:return "Power It"
        case .foodie: return "Foodie Fun"
        case .art: return "Art & Fashion"
        case .home: return "Home is Where the heart is"
        }
    }
}
