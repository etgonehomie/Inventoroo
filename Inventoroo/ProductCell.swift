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

// MARK: - CellLayout Extension
extension ProductCell: CellLayout {
    
    var portraitSize: CGSize {
        CGSize(width: 200, height: 200)
    }
    var landscapeSize: CGSize {
        CGSize(width: 50, height: 50)
    }
}
