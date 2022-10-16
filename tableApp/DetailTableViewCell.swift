//
//  DetailTableViewCell.swift
//  tableApp
//
//  Created by Damirka on 16.10.2022.
//

import UIKit


class DetailTableViewCell: UITableViewCell {
    let digitLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        digitLabel.textColor = .black
        digitLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(digitLabel)
        digitLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        digitLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        digitLabel.widthAnchor.constraint(equalToConstant: 100)
        digitLabel.heightAnchor.constraint(equalToConstant: 25)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setDigit(digit: String) {
        digitLabel.text = digit
    }
}
