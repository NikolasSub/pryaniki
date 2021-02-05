//
//  ViewDescription.swift
//  pryaniki
//
//  Created by Nikolay Shelepov on 01.02.2021.
//

import Foundation

enum ViewDescription: String, Codable{
    case hz
    case selector
    case picture
    case none
    
    init?(rawValue: String) {
        switch rawValue {
        case "hz":
            self = .hz
        case "selector":
            self = .selector
        case "picture":
            self = .picture
        default:
            self = .none
        }
    }
}
