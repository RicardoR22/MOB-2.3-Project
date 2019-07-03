//
//  ViewController.swift
//  Mob2.3FinalProject
//
//  Created by Ricardo Rodriguez on 6/30/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var homeView: HomeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let homeView = HomeView(frame: self.view.frame)
        self.homeView = homeView
        self.view.addSubview(homeView)
        
        DispatchQueue.global(qos: .background).async {
            ServiceLayer.request(router: Router.getNasaData) { (result: Result<[String: String]>) in
                switch result {
                case .success(let result):
                    print("success")
                    print(result)
                    guard let imageURL = URL(string: result["url"]!),
                        let imageData = try? Data(contentsOf: imageURL) else {
                            return
                    }
                    DispatchQueue.main.async {
                        homeView.imageView.image = UIImage(data: imageData)
                        homeView.titleLabel.text = result["title"]
                        homeView.descriptionLabel.text = result["explanation"]
                        homeView.loadIndicator.removeFromSuperview()
                    }
                    
                case .failure(let error):
                    print("fail")
                }
            }
        }
    }


}

