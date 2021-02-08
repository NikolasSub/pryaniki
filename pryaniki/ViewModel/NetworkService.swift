//
//  NetworkService.swift
//  pryaniki
//
//  Created by Nikolay Shelepov on 30.01.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

final class NetworkService{
    private let url: String = "https://pryaniky.com/static/json/sample.json"
    
    public func getData(callback: @escaping (Model) -> Void) {
        AF.request(url, method: .get, parameters: nil).validate().responseJSON(completionHandler: {  response in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                let model = Model(json: json)
                callback(model)
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
}
