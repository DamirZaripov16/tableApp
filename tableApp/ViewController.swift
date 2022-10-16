//
//  ViewController.swift
//  tableApp
//
//  Created by Damirka on 16.10.2022.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    
    var testTableView = UITableView()
    let identifier = "SomeCell"
    let dataArray = [
        "RowExample-1", "RowExample-2", "RowExample-3", "RowExample-4", "RowExample-5",
        "RowExample-6", "RowExample-7", "RowExample-8", "RowExample-9", "RowExample-10",
        "RowExample-11", "RowExample-12", "RowExample-13", "RowExample-14", "RowExample-15",
        "RowExample-16", "RowExample-17", "RowExample-18", "RowExample-19", "RowExample-20"
    ]

    // MARK: - Private methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testTableView = UITableView(frame: view.bounds, style: .plain)
        testTableView.register(DetailTableViewCell.self, forCellReuseIdentifier: identifier)
        testTableView.delegate = self
        testTableView.dataSource = self
        view.addSubview(testTableView)
    }
}

    // MARK: - Extensions
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.digit = dataArray[indexPath.row]
        present(detailViewController, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? DetailTableViewCell
        cell?.setDigit(digit :dataArray[indexPath.row])
        return cell ?? DetailTableViewCell()
    }
}

