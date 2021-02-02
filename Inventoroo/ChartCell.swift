//
//  ChartCell.swift
//  Inventoroo
//
//  Created by Eric Tom on 1/29/21.
//

import UIKit

class ChartCell: UICollectionViewCell {
    
    static let reuseIdentifier: String = "chartCellId"

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not be implemented")
    }
    
    private func setupViews() {
        backgroundColor = UIColor.blue
        largeContentTitle = "hello world"
        
    }
        
}

extension ChartCell: CellLayout {
    private var portraitSide: Int { 400 }
    private var landscapeSide: Int { 100 }

    var portraitSize: CGSize {
        CGSize(width: portraitSide, height: portraitSide)
    }
    
    var landscapeSize: CGSize {
        CGSize(width: landscapeSide, height: landscapeSide)
    }
}
