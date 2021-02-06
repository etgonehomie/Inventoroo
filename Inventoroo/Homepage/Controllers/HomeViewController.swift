//
//  HomeViewController.swift
//  Inventoroo
//
//  Created by Eric Tom on 2/4/21.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        configure()
    }
    
    
    // MARK: - TableView Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let mainCell: UITableViewCell
        if indexPath.row.isMultiple(of: 2) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableCell.identifier, for: indexPath) as? MainTableCell else { return UITableViewCell() }
            mainCell = cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableCell2.identifier, for: indexPath) as? MainTableCell2 else { return UITableViewCell() }
            mainCell = cell
        }
        
        let contentView = mainCell.contentView
        var content = mainCell.defaultContentConfiguration()
        
            content.text = """
                lorem ipsume lkjlkajs dnsanfdo nksl dlkalkjt kadjf
                lorem ipsume lkjlkajs dnsanfdo nksl dlkalkjt kadjf
                lorem ipsume lkjlkajs dnsanfdo nksl dlkalkjt kadjf
                lorem ipsume lkjlkajs dnsanfdo nksl dlkalkjt kadjf
                lorem ipsume lkjlkajs dnsanfdo nksl dlkalkjt kadjf
                lorem ipsume lkjlkajs dnsanfdo nksl dlkalkjt kadjf
                lorem ipsume lkjlkajs dnsanfdo nksl dlkalkjt kadjf
                lorem ipsume lkjlkajs dnsanfdo nksl dlkalkjt kadjf
                lorem ipsume lkjlkajs dnsanfdo nksl dlkalkjt kadjf
                lorem ipsume lkjlkajs dnsanfdo nksl dlkalkjt kadjf
                """
        
        mainCell.contentConfiguration = content
//
//        NSLayoutConstraint.activate([
//            cell.contentView.heightAnchor.constraint(equalTo: cell.superview!.heightAnchor, multiplier: 0.25)
//        ])

        return mainCell
    }
    
    // MARK: - Private functions
    private func configure() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 500
        tableView.register(MainTableCell.self, forCellReuseIdentifier: MainTableCell.identifier)
        tableView.register(MainTableCell2.self, forCellReuseIdentifier: MainTableCell2.identifier)
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor),
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}
