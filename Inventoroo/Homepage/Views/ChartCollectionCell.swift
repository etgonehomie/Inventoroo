//
//  ChartCell.swift
//  Inventoroo
//
//  Created by Eric Tom on 1/29/21.
//

import UIKit

class ChartCollectionCell: UICollectionViewCell {
    static let identifier: String = "chartCollectionCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not be implemented")
    }
    
    private func setupViews() {
        let labelView = UILabel(frame: contentView.frame)
        labelView.text = "Chart Collection Cell: this is super long the END"
        labelView.textAlignment = .center
        labelView.lineBreakMode = .byWordWrapping
        labelView.numberOfLines = 0
        labelView.font = UIFont(name: "AmericanTypewriter-Bold", size: 40)
        addSubview(labelView)
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "test")
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        
        labelView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            labelView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            labelView.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -50),
            labelView.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor),
        ])
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: labelView.bottomAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor),
            imageView.bottomAnchor.constraint(lessThanOrEqualTo: layoutMarginsGuide.bottomAnchor),
        ])
        backgroundColor = UIColor.blue
    }
}
