//
//  MenuOption.swift
//  M-News
//
//  Created by Julius on 07/04/2021.
//

import UIKit

enum MenuOption: Int, CustomStringConvertible {
    case Profile
    case Logout
    case Settings
    
    var description: String {
        switch self {
        case .Profile: return "Profile"
        case .Logout: return "Logout"
        case .Settings: return "Settings"
        }
    }
    
    var image: UIImage {
        switch self {
        case .Profile: return UIImage(named: "p") ?? UIImage()
        case .Logout: return UIImage(named: "logout") ?? UIImage()
        case .Settings: return UIImage(named: "settings") ?? UIImage()
        }
    }
    
}
