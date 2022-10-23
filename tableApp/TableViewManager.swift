//
//  TableViewManager.swift
//  tableApp
//
//  Created by Damirka on 16.10.2022.
//

import UIKit

protocol TableViewManagerDelegate: UIViewController {
    func handleTableViewCellTap(with row: RowViewModel)
}

protocol ManagesTableView: UITableViewDataSource, UITableViewDelegate {
    func configure(with rows: [RowViewModel])

    var delegate: TableViewManagerDelegate? { get set }
}

final class TableViewManager: NSObject, ManagesTableView {
    // MARK: - Properties

    weak var delegate: TableViewManagerDelegate?
    private var rows: [RowViewModel] = []
}

// MARK: - ManagesTableView

extension TableViewManager {
    func configure(with rows: [RowViewModel]) {
        self.rows = rows
    }
}

// MARK: - UITableViewDataSource

extension TableViewManager {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: DetailTableViewCell.self),
            for: indexPath
        ) as? DisplaysDetailTableViewCell
        cell?.configure(with: rows[indexPath.row])
        return cell ?? DetailTableViewCell()
    }
}

// MARK: - UITableViewDelegate

extension TableViewManager {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.handleTableViewCellTap(with: rows[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
