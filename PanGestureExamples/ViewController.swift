//
//  ViewController.swift
//  PanGestureExamples
//
//  Created by Alexander Murphy on 9/3/18.
//  Copyright © 2018 Alexander Murphy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let square = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        square.translatesAutoresizingMaskIntoConstraints = false
        square.backgroundColor = .green
        square.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(squareDidPan(_:))))
        
        view.addSubview(square)
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: square, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150),
            NSLayoutConstraint(item: square, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150),
            NSLayoutConstraint(item: square, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 100),
            NSLayoutConstraint(item: square, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
            ])
    }


    @objc private func squareDidPan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        square.center = CGPoint(x: square.center.x + translation.x, y: square.center.y + translation.y)
        sender.setTranslation(.zero, in: view)
    }
}

