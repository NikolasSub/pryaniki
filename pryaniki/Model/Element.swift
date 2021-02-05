//
//  Element.swift
//  pryaniki
//
//  Created by Nikolay Shelepov on 02.02.2021.
//

import Foundation

protocol Element: Codable {
    var viewDescription: ViewDescription { get }
}

struct None: Element{
    var viewDescription: ViewDescription = .none
}

struct Headline: Element, Codable{
    let viewDescription: ViewDescription
    var text: String
}

struct Selector: Element, Codable{
    var viewDescription: ViewDescription
    var selectedId: Int
    var variants: [Variant]
}

struct Picture: Element, Codable{
    var viewDescription: ViewDescription
    var PictureImage: PictureImage
}

struct Variant: Codable{
    let id: Int
    let text: String
}

struct PictureImage: Codable{
    let url: URL
    let text: String
}
