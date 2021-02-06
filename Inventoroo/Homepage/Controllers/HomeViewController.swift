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
    
    // Each row will be a collection view contained within a tableview cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 1 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell?
        switch indexPath.section {
        case 0:
            // create chart cell
            let chartCell = tableView.dequeueReusableCell(withIdentifier: ChartTableCell.identifier, for: indexPath) as? ChartTableCell
            cell = chartCell
            
        // this cell contains a collection view on the content view container
        
        default:
            // create product cell
            let productCell = tableView.dequeueReusableCell(withIdentifier: MainTableCell.identifier, for: indexPath) as? MainTableCell
            cell = productCell
            
            // this cell contains a collection view on the content view container
        }
        
        guard let _cell = cell else { return UITableViewCell() }
                
        let contentView = _cell.contentView
        var content = _cell.defaultContentConfiguration()
        
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
        
        _cell.contentConfiguration = content
        return _cell
    }
    
    // MARK: - Private functions
    private func configure() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 500
        tableView.register(MainTableCell.self, forCellReuseIdentifier: MainTableCell.identifier)
        tableView.register(MainTableCell2.self, forCellReuseIdentifier: MainTableCell2.identifier)
        tableView.register(ChartTableCell.self, forCellReuseIdentifier: ChartTableCell.identifier)
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
