//
//  ChartCell.swift
//  Inventoroo
//
//  Created by Eric Tom on 1/29/21.
//

import UIKit

protocol CellAttributable {
    var attributes: CollectionCellAttributes { get }
}
struct CollectionCellAttributes {
    let identifier: String
    let itemWidth: CGFloat
    let itemHeight: CGFloat
    let itemSize: CGSize
    
    init(identifier: String, itemWidth: CGFloat, itemHeight: CGFloat) {
        self.identifier = identifier
        self.itemWidth = itemWidth
        self.itemHeight = itemHeight
        itemSize = CGSize(width: itemWidth, height: itemHeight)
    }
}

class CustomCollectionCell: UICollectionViewCell, CellAttributable {
    let attributes = CollectionCellAttributes(identifier: "customCellId", itemWidth: 100, itemHeight: 100)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not be implemented")
    }
}

class ChartCollectionCell: UICollectionViewCell, CellAttributable {
    let attributes = CollectionCellAttributes(identifier: "chartCellId", itemWidth: 100, itemHeight: 100)
    static let identifier: String = "chartCellId"

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not be implemented")
    }
    
    private func setupViews() {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "test")
        imageView.contentMode = .scaleToFill
        addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let shorterAnchor = BoilerplateUtilities.deviceAnchors(for: contentView).shorterAnchor
        
        let padding = portraitSize.width * -0.25
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: shorterAnchor, constant: padding),
            imageView.heightAnchor.constraint(equalTo: shorterAnchor, constant: padding),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
        backgroundColor = UIColor.blue
    }
}

extension ChartCollectionCell: CellLayout {
    
    var portraitSize: CGSize {
        let side = BoilerplateUtilities.shorterDeviceSide * 0.9
        return CGSize(width: side, height: side)
    }
    
    var landscapeSize: CGSize {
        portraitSize
    }
}
