//
//  ProductCell.swift
//  Inventoroo
//
//  Created by Eric Tom on 1/29/21.
//

import UIKit
class ProductCell: UICollectionViewCell {
    static let identifier = "productCellId"
    
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
        let side = BoilerplateUtilities.shorterDeviceSide * 0.7
        return CGSize(width: side, height: side)
    }
    
    var landscapeSize: CGSize {
        portraitSize
    }
}
