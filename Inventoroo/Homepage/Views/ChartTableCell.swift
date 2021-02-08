//
//  ChartTableCell.swift
//  Inventoroo
//
//  Created by Eric Tom on 2/7/21.
//

import UIKit
import Foundation

// MARK: - TableViewCell
class ChartTableCell: UITableViewCell {
    var collectionView: UICollectionView!
    var titleView: UILabel!
    var collectionCellIdentifier: String!
    static let identifier: String = "chartTableCell"
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        contentView.backgroundColor = .gray
    
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 1000, height: 500)
        flowLayout.estimatedItemSize = CGSize(width: 1000, height: 400)
        
        collectionView = UICollectionView(frame: contentView.frame, collectionViewLayout: flowLayout)
        
        collectionView.register(ChartCollectionCell.self, forCellWithReuseIdentifier: ChartCollectionCell.identifier)
        collectionView.autoresizingMask = .flexibleHeight
        collectionView.autoresizesSubviews = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
//        collectionView.tag = row
        
        // Title View
        titleView = UILabel(frame: contentView.frame)
        titleView.font = UIFont(name: "AmericanTypewriter-Bold", size: 70)
        titleView.text = "Hello world"
        
        // MARK: - Constraints
        addSubview(collectionView)
        addSubview(titleView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        titleView.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            titleView.bottomAnchor.constraint(equalTo: collectionView.topAnchor),
            titleView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            titleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        ])
        titleView.backgroundColor = .yellow
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: titleView.bottomAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        ])
        collectionView.backgroundColor = .green
    }
}

// MARK: - Ext. CollectionView Hooks
extension ChartTableCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // TODO: - determine based on model.count
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChartCollectionCell.identifier, for: indexPath)
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        switch indexPath.section {
//        case 0:
//            return CollectionCellType.chart.itemSize
//        default:
//            return CollectionCellType.product.itemSize
//        }
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("you selected section:\(indexPath.section) row:\(indexPath.row)")
    }
}
