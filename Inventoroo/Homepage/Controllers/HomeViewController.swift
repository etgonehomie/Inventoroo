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
        tableView.reloadData()
    }
    
    @objc func rotated() {
        tableView.reloadData()
    }

    // MARK: - TableView Delegate
    func numberOfSections(in tableView: UITableView) -> Int { 2 }
    
    // Each row will be a collection view contained within a tableview cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 1 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EmbeddedCollectionTableViewCell.identifier, for: indexPath) as? EmbeddedCollectionTableViewCell else { return UITableViewCell() }
        switch indexPath.section {
        case 0:
            cell.configure(with: ChartCollectionCell(), forRow: indexPath.row)
        default:
            cell.configure(with: ProductCell(), forRow: indexPath.row)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // If want to make even more dynamic check this link out.
        // Cannot make it dynamic based on subview content, because heightForRowAt is called before cellForRowAt
        // https://stackoverflow.com/questions/36459477/dynamically-resizing-uitableviewcell-heights-in-ios-swift
        return BoilerplateUtilities.longerDeviceSide / 2
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return BoilerplateUtilities.longerDeviceSide / 2
    }
    
    // MARK: - Private functions
    private func configure() {
        tableView.register(EmbeddedCollectionTableViewCell.self, forCellReuseIdentifier: EmbeddedCollectionTableViewCell.identifier)
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
