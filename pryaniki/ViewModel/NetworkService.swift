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
    var data: Data?
    var viewData: ViewData?
    private let url: String = "https://pryaniky.com/static/json/sample.json"
    
    public func getData() {
        AF.request(url, method: .get, parameters: nil).validate().responseJSON(completionHandler: { [self] response in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                if self.data == nil{
                    self.data = Data(json: json)
                    print(self.data)
                }
                if self.viewData == nil{
                    self.viewData = ViewData(json: json)
                    print(self.viewData)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
}
