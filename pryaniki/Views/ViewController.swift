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
    var model: Model?
    private(set) var stackView: UIStackView = {
        let view = UIStackView()
        view.alignment = .fill
        view.distribution = .fill
        view.axis = .vertical
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
      //  self.view.addSubview(self.stackView)
        view.backgroundColor = .white
        service.getData(callback: { model in
            DispatchQueue.main.async{
                self.view.addSubview(self.stackView)
                self.setUpAutoLayout()
                self.model = model
                for element in self.model!.viewData.elements{
                               switch element {
                               case .hz:
                                let label = UILabel()
                                label.translatesAutoresizingMaskIntoConstraints = false
                                if let headline = self.model?.data.elements.first(where: {
                                    $0.viewDescription == .hz}) as? Headline{
                                    label.text = headline.text
                                   }
                                self.stackView.addSubview(label)
                                self.setOnTheCenter(firstView: self.stackView, secondView: label)
                               case .selector:
                                let segmentedControl = UISegmentedControl()
                                segmentedControl.translatesAutoresizingMaskIntoConstraints = false
                                segmentedControl.backgroundColor = .gray
                                if let selector = self.model?.data.elements.first(where: { $0.viewDescription == .selector}) as? Selector{
                                       for variant in selector.variants{
                                           segmentedControl.insertSegment(withTitle: variant.text, at: variant.id, animated: true)
                                       }
                                   }
                                self.stackView.addSubview(segmentedControl)
                                self.setOnTheCenter(firstView: self.stackView, secondView: segmentedControl)
                               case .picture:
                                let pictureImageView = UIImageView()
                                pictureImageView.translatesAutoresizingMaskIntoConstraints = false
                                if let picture = self.model?.data.elements.first(where: {
                                    $0.viewDescription == .picture
                                }) as? Picture{
                                    pictureImageView.kf.setImage(with: picture.PictureImage.url, placeholder: UIImage(named: picture.PictureImage.text))
                                    pictureImageView.sizeToFit()
                                }
                                self.stackView.addSubview(pictureImageView)
                                self.setOnTheCenter(firstView: self.stackView, secondView: pictureImageView)
                                self.setSize(firstView: self.stackView, secondView: pictureImageView)
                               default:
                                   ()
                               }
                   }
            }
        })
        super.viewDidLoad()
    }
    
    private func setOnTheCenter<T: UIView, V: UIView>(firstView: T, secondView: V){
        firstView.centerXAnchor.constraint(equalTo: secondView.centerXAnchor).isActive = true
    }
    
    private func setSize<T: UIView, V: UIView>(firstView: T, secondView: V){
        firstView.heightAnchor.constraint(equalTo: secondView.heightAnchor, multiplier: 2).isActive = true
        firstView.widthAnchor.constraint(equalTo: secondView.widthAnchor, multiplier: 2).isActive = true
    }
    
    private func setUpAutoLayout(){
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant:  view.frame.height/2).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}


