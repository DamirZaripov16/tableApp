//
//  DetailTableViewCell.swift
//  tableApp
//
//  Created by Damirka on 16.10.2022.
//

import UIKit

protocol DisplaysDetailTableViewCell: UITableViewCell {
    func configure(with viewModel: RowViewModel)
}

class DetailTableViewCell: UITableViewCell {
    // MARK: - Properties

    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubviews()
        makeConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Private

    private func addSubviews() {
        addSubview(label)
    }

    private func makeConstraints() {
        NSLayoutConstraint.activate(
            [
                label.centerXAnchor.constraint(equalTo: centerXAnchor),
                label.centerYAnchor.constraint(equalTo: centerYAnchor)
            ]
        )
    }
}

// MARK: - DisplaysDetailTableViewCell

extension DetailTableViewCell: DisplaysDetailTableViewCell {
    func configure(with viewModel: RowViewModel) {
        label.text = viewModel.title
    }
}
