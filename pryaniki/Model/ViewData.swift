//
//  ViewData.swift
//  pryaniki
//
//  Created by Nikolay Shelepov on 01.02.2021.
//

import Foundation
import SwiftyJSON

struct ViewData: Codable{
    let elements: [ViewDescription]
    
    init(json: JSON) {
        self.elements = json["view"].arrayValue.map{ ViewDescription(rawValue: $0.stringValue)! }
    }
}
