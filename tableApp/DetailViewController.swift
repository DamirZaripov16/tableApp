//
//  DetailViewController.swift
//  tableApp
//
//  Created by Damirka on 16.10.2022.
//

import UIKit

class DetailViewController: UIViewController {
    // MARK: - Properties

    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()

    // MARK: - Lifecycle

    init(title: String) {
        super.init(nibName: nil, bundle: nil)

        titleLabel.text = title
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black

        addSubviews()
        makeConstraints()
    }

    // MARK: - Private

    private func addSubviews() {
        view.addSubview(titleLabel)
    }

    private func makeConstraints() {
        NSLayoutConstraint.activate(
            [
                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ]
        )
    }
}
