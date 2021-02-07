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
    func numberOfSections(in tableView: UITableView) -> Int { 2 }
    
    // Each row will be a collection view contained within a tableview cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 1 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EmbeddedCollectionTableViewCell.identifier, for: indexPath) as? EmbeddedCollectionTableViewCell else { return UITableViewCell() }
        

//        switch indexPath.section {
//        case 0:
//            cell.configureEmbeddedCollectionView(for: ChartCollectionCell.self, identifier: ChartCollectionCell.identifier)
//        default:
//            cell.configureEmbeddedCollectionView(for: ProductCell.self, identifier: ProductCell.identifier)
//        }
//        let contentView = cell.contentView
//        print("***tableview cell content view width = \(contentView.frame.width)")
//        print("***tableview cell content view height = \(contentView.frame.height)")
//        var content = cell.defaultContentConfiguration()
//
//        cell.dummyConfigure(for: indexPath.section)
//        content.text = cell.title
//        cell.contentConfiguration = content
//        
//        cell.frame = tableView.bounds
////        cell.layoutIfNeeded()
//        cell.collectionView.reloadData()
//        cell.collectionViewHeight.constant = cell.collectionView.collectionViewLayout.collectionViewContentSize.height
//        tableView.beginUpdates()
//        tableView.endUpdates()
        return cell
    }
    
    // TODO: Not automatically adjusting height to the collection view within
    // look at: https://mobikul.com/manage-collection-view-height-inside-the-table-view-cell-using-swift-4/
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        UITableView.automaticDimension
//    }
    
    
    // MARK: - Private functions
    private func configure() {
        tableView.rowHeight = 400
//        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 500
        tableView.register(EmbeddedCollectionTableViewCell.self, forCellReuseIdentifier: EmbeddedCollectionTableViewCell.identifier)
//        tableView.register(ChartTableCell.self, forCellReuseIdentifier: ChartTableCell.identifier)
//        tableView.register(MainTableCell.self, forCellReuseIdentifier: MainTableCell.identifier)
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
