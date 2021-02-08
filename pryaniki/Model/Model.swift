//
//  Model.swift
//  pryaniki
//
//  Created by Nikolay Shelepov on 08.02.2021.
//

import Foundation
import SwiftyJSON

final class Model{
    var data: Data
    var viewData: ViewData
    
    init(json: JSON) {
        self.data = Data(json: json)
        self.viewData = ViewData(json: json)
    }
}
