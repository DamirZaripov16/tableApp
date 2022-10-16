//
//  DetailViewController.swift
//  tableApp
//
//  Created by Damirka on 16.10.2022.
//

import UIKit

class DetailViewController: UIViewController {
    // MARK: - Properties
    
    var digit: String = ""
    
    // MARK: - Private methods
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        let digitLabel = UILabel()
        digitLabel.text = digit
        digitLabel.textColor = .white
        digitLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(digitLabel)
        digitLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        digitLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        digitLabel.widthAnchor.constraint(equalToConstant: 100)
        digitLabel.heightAnchor.constraint(equalToConstant: 25)

    }
}
