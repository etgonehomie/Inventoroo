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
        let imageView = UIImageView()
        imageView.image = UIImage(named: "test")
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = true
        imageView.bounds = CGRect(
            x: 0,
            y: 0,
            width: 207,
            height: 100
        )
        
        imageView.center = CGPoint(
            x: UIScreen.main.bounds.midX,
            y: UIScreen.main.bounds.midY
        )
        imageView.autoresizingMask = [
            .flexibleLeftMargin,
            .flexibleRightMargin,
            .flexibleTopMargin,
            .flexibleBottomMargin
        ]
//        title.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0(40)]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": title]))
//        title.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(40)]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": title]))

        backgroundColor = UIColor.blue
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
