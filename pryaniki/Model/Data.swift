//
//  Data.swift
//  pryaniki
//
//  Created by Nikolay Shelepov on 02.02.2021.
//

import Foundation
import SwiftyJSON

struct Data{
    var elements: [Element]
    
    init(json: JSON) {
        self.elements = json["data"].arrayValue.map{
            switch ViewDescription(rawValue: $0["name"].stringValue){
            case .hz:
                return Headline(viewDescription: .hz, text: $0["data"].stringValue)
            case .picture:
                return Picture(viewDescription: .picture, PictureImage: PictureImage(url: URL(string: $0["data"]["url"].stringValue)!, text: $0["data"]["text"].stringValue))
            case .selector:
                var variants: [Variant] = []
                for index in 0...$0["data"]["variants"].count{
                    variants.append(Variant(id: $0["data"]["variants"][index]["id"].intValue, text: $0["data"]["variants"][index]["text"].stringValue))
                }
                return Selector(viewDescription: .selector, selectedId: $0["data"]["selectedId"].intValue, variants: variants)
            default:
                return None()
            }
        }
    }
}
