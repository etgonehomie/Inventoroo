//
//  ProductCell.swift
//  Inventoroo
//
//  Created by Eric Tom on 1/29/21.
//

import UIKit

class ProductTableCell: UITableViewCell {
    static let identifier = "productTableCell"
    var collectionView: UICollectionView!
    var titleView: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not be implemented")
    }
    
    private func setupViews() {
        let flowLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // create subviews
        // create a stack view with a header and a collection view
        
        // add constraints
        
        // add dummy background colors
    }
}

extension ProductTableCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}
