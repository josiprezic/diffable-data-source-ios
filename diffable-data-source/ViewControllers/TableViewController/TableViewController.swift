//
//  TableViewController.swift
//  diffable-data-source
//
//  Created by Josip Rezic on 31/01/2020.
//  Copyright © 2020 Josip Rezic. All rights reserved.
//

import UIKit

final class TableViewController: UITableViewController {
    
    //
    // MARK: - Enums
    //
    
    enum Section: CaseIterable {
        case main
    }
    
    //
    // MARK: - Properties
    //
    
    @available(iOS 13.0, *)
    private lazy var dataSource: UITableViewDiffableDataSource<Section, RandomNumber>? = nil
    
    private var randomNumbersProvider = RandomNumbersProvider()
    private var randomizeButton: UIBarButtonItem?
    
    //
    // MARK: - View methods
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomizeButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(handleRandomizeButtonPressed))
        setupUI()
        configureTableView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        populateTableView()
    }
    
    //
    // MARK: - Actions
    //
    
    @objc func handleRandomizeButtonPressed() {
        randomNumbersProvider.updateCurrentState()
        populateTableView()
    }
    
    //
    // MARK: - Private methods
    //
    
    private func setupUI() {
        title = String(describing: TableViewController.self)
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = randomizeButton
    }
    
    private func configureTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
        tableView.delegate = self
        setupTableViewDataSource()
    }
}

//
// MARK: - TableViewDelegate, TableViewDataSource methods
//

extension TableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randomNumbersProvider.currentState.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self)) else {
            fatalError("\(#function): Cannot dequeue reusable cell.")
        }
        cell.textLabel?.text = "\(randomNumbersProvider.currentState[indexPath.row])"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//
// MARK: - DifferDataSource methods
//

extension TableViewController {
    
    private func setupTableViewDataSource() {
        if #available(iOS 13.0, *) {
            dataSource = .init(tableView: tableView, cellProvider: { [weak self] (tableView, indexPath, item) -> UITableViewCell? in
                guard let self = self else { return nil }
                let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
                cell.textLabel?.text = "\(self.randomNumbersProvider.currentState[indexPath.row])"
                return cell
            })
        } else {
            tableView.dataSource = self
        }
    }
    
    private func populateTableView() {
        if #available(iOS 13.0, *) {
            var snapshot = NSDiffableDataSourceSnapshot<Section, RandomNumber>()
            snapshot.appendSections(Section.allCases)
            snapshot.appendItems(randomNumbersProvider.currentState)
            dataSource?.apply(snapshot)
        } else {
            tableView.reloadData()
        }
    }
}
