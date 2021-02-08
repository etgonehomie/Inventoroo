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
//        let labelView = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let labelView = UILabel()
        labelView.font = UIFont(name: "AmericanTypewriter-Bold", size: 50)
        labelView.text = "ProductCell"
        self.addSubview(labelView)
        backgroundColor = UIColor.brown
        
        labelView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            labelView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            labelView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            labelView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
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
