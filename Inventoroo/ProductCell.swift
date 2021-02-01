//
//  ProductCell.swift
//  Inventoroo
//
//  Created by Eric Tom on 1/29/21.
//

import UIKit
class ProductCell: UICollectionViewCell {
    
    static let reuseIdentifier: String = "productCellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not be implemented")
    }
    
    private func setupViews() {
        backgroundColor = UIColor.yellow
        largeContentTitle = "hello world"
        
    }
        
}

extension ProductCell: CellLayout {
    var landscapeSize: CGSize {
        CGSize(width: 100, height: 100)
    }
    
    var portraitSize: CGSize {
        landscapeSize
    }
}