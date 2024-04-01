//
//  HomeViewController.swift
//  advanced-codables-demo
//
//  Created by Avijeet on 01/04/24.
//

import UIKit

// MARK: - HomeViewController
class HomeViewController: UIViewController {
    
    var datasource = [Article.Response]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - Views
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        tableView.register(HeadingCell.self, forCellReuseIdentifier: HeadingCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        prepareJsonFromFile()
    }
    
    // MARK: - setupui
    func configureUI() {
        view.addSubview(tableView)
        configureConstraints()
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func prepareJsonFromFile() {
        do {
            if let url = Bundle.main.url(forResource: "mock", withExtension: "json"),
               let data = try? Data(contentsOf: url),
               let result = try? JSONDecoder().decode(Article.self, from: data) {
                datasource = result.response
            }
        }
    }
}


extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let headingCell = tableView.dequeueReusableCell(withIdentifier: HeadingCell.reuseIdentifier, for: indexPath) as? HeadingCell else { return UITableViewCell() }
        headingCell.configure(model: .init(text: "hello", size: 24))
        
        return headingCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
}
