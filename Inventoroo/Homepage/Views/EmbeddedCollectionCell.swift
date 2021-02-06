//
//  File.swift
//  Inventoroo
//
//  Created by Eric Tom on 2/5/21.
//

import UIKit

class EmbeddedCollectionCell: UITableViewCell {
    static let identifier: String = "embeddedCollectionCellId"
    var title: String?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(for collectionView: UICollectionView, with title: String) {
        self.title = title
        // Sets the collection view to be within the table views contentView
    }
    
}
class ChartTableCell: UITableViewCell {
    static let identifier: String = "chartCellId"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
