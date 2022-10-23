//
//  ViewController.swift
//  tableApp
//
//  Created by Damirka on 16.10.2022.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    
    private lazy var tableView = {
        let tableView = UITableView()
        tableView.dataSource = tableViewManager
        tableView.delegate = tableViewManager
        tableView.register(
            DetailTableViewCell.self,
            forCellReuseIdentifier: String(describing: DetailTableViewCell.self)
        )
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private let tableViewManager: ManagesTableView

    // MARK: - Lifecycle

    init(tableViewManager: ManagesTableView = TableViewManager()) {
        self.tableViewManager = tableViewManager

        super.init(nibName: nil, bundle: nil)

        self.tableViewManager.delegate = self
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        makeConstraints()

        tableViewManager.configure(
            with: (0..<20).map { index in
                RowViewModel(title: "RowExample-\(index)")
            }
        )
        tableView.reloadData()
    }

    // MARK: - Private

    private func addSubviews() {
        view.addSubview(tableView)
    }

    private func makeConstraints() {
        NSLayoutConstraint.activate(
            [
                tableView.topAnchor.constraint(equalTo: view.topAnchor),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ]
        )
    }
}

// MARK: - TableViewManagerDelegate

extension ViewController: TableViewManagerDelegate {
    func handleTableViewCellTap(with row: RowViewModel) {
        let detailViewController = DetailViewController(title: row.title)
        present(detailViewController, animated: true)
    }
}
