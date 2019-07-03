//
//  HomeViewConstraints.swift
//  Mob2.3FinalProject
//
//  Created by Ricardo Rodriguez on 7/2/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import Foundation

extension HomeView {
    
    func setViewConstraints() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: frame.height * 0.4).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: frame.width * 0.8).isActive = true
        imageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.heightAnchor.constraint(equalToConstant: frame.height * 0.05).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: frame.width * 0.9).isActive = true
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        
        loadIndicator.translatesAutoresizingMaskIntoConstraints = false
        loadIndicator.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        loadIndicator.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        
        
        
    }
}
