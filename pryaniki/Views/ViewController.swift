//
//  ViewController.swift
//  pryaniki
//
//  Created by Nikolay Shelepov on 30.01.2021.
//

import UIKit
import SwiftyJSON
import Kingfisher

class ViewController: UIViewController {
    var service = NetworkService()
  //  let uiView: UIView!
    var label: UILabel!
    var segmentedControl: UISegmentedControl!

    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        service.getData()
        super.viewDidLoad()
    }
    
    override func loadView(){
        guard let viewData = service.viewData, let data = service.data else { return }
        for element in viewData.elements{
            switch element {
            case .hz:
                label = UILabel()
                label.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
                if let headline = data.elements.first(where: { $0.viewDescription == .hz}) as? Headline{
                    label.text = headline.text
                }
                view.addSubview(label)
            case .selector:
                segmentedControl = UISegmentedControl()
                if let selector = data.elements.first(where: { $0.viewDescription == .selector}) as? Selector{
                    for variant in selector.variants{
                        segmentedControl.insertSegment(withTitle: variant.text, at: variant.id, animated: true)
                    }
                }
                view.addSubview(segmentedControl)
          /*  case .picture:
                let imageView = UIImageView()
                imageView.kf. */
            default:
                ()
            }
        }
        super.loadView()
    }

}

