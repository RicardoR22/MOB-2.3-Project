//
//  HomeView.swift
//  Mob2.3FinalProject
//
//  Created by Ricardo Rodriguez on 7/2/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit

class HomeView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    func setupView() {
        backgroundColor = .white
        setupSubViews()
        setViewConstraints()
    }
    
    func setupSubViews() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        imageView.addSubview(loadIndicator)
    }
    

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        return imageView
    }()
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()
    
    let descriptionLabel: UITextView = {
        let label = UITextView()
        label.font = UIFont.systemFont(ofSize: 16)
        label.isEditable = false
        label.textAlignment = .center
        
        return label
    }()
    
    let loadIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
        
        return indicator
    }()
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
