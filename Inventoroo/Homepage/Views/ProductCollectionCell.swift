//
//  ProductCollectionCell.swift
//  Inventoroo
//
//  Created by Eric Tom on 2/8/21.
//

import UIKit

class ProductCollectionCell: UICollectionViewCell {
    static let identifier = "productCollectionCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
    }
}
