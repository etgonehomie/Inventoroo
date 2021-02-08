//
//  File.swift
//  Inventoroo
//
//  Created by Eric Tom on 2/5/21.
//

import UIKit
import Foundation

enum CollectionCellType: String {
    case chart = "chartId"
    case product = "productId"
    
    var itemSize: CGSize {
        var side = BoilerplateUtilities.longerDeviceSide
        switch self {
        case .chart:
            side = side * 0.8
        case .product:
            side = side * 0.5
        }
        return CGSize(width: side, height: side)
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .chart:
            return .red
        case .product:
            return .blue
        }
    }
    
    var cellType: UICollectionViewCell {
        switch self {
        case .chart:
            return ChartCollectionCell()
        case .product:
            return ProductCell()
        }
    }
}

// MARK: - TableViewCell
class EmbeddedCollectionTableViewCell: UITableViewCell {
    var collectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: UICollectionViewLayout())
    var titleView: UILabel!
    var collectionCellIdentifier: String!
        
    static let identifier: String = "embeddedCollectionViewCellId"
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func registerFactory(collectionCell: UICollectionViewCell) {
        guard let cell = collectionCell as? CellAttributable else { return }
        collectionCellIdentifier = cell.attributes.identifier
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = cell.attributes.itemSize
        collectionView = UICollectionView(frame: contentView.frame, collectionViewLayout: flowLayout)

        switch collectionCell {
        case collectionCell as ChartCollectionCell:
            collectionView.register(ChartCollectionCell.self, forCellWithReuseIdentifier: collectionCellIdentifier)
        case collectionCell as CustomCollectionCell:
            collectionView.register(CustomCollectionCell.self, forCellWithReuseIdentifier: collectionCellIdentifier)
        default:
            collectionView.register(ProductCell.self, forCellWithReuseIdentifier: collectionCellIdentifier)
        }
    }
    
    func configure(with collectionCell: UICollectionViewCell, forRow row: Int) {
        contentView.backgroundColor = .gray
        registerFactory(collectionCell: collectionCell)
        addSubview(collectionView)
        
        // Title View
        titleView = UILabel(frame: contentView.frame)
        titleView.font = UIFont(name: "AmericanTypewriter-Bold", size: 70)

        titleView.text = "Hello world"
        addSubview(titleView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.tag = row
        

        
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
extension EmbeddedCollectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        let sectionAttributes = SectionAttributesFactory.createSectionAttributes(for: section)
//        return sectionAttributes.numOfItemsInSection
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellIdentifier, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CollectionCellType.chart.itemSize
        default:
            return CollectionCellType.product.itemSize
        }
//        return CGSize(width: 200, height: 200)
        let sectionAttributes = SectionAttributesFactory.createSectionAttributes(for: indexPath.section)
        return UIDevice.current.orientation.isLandscape ? sectionAttributes.cellLayout.landscapeSize : sectionAttributes.cellLayout.portraitSize
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("you selected section:\(indexPath.section) row:\(indexPath.row)")
    }
}
