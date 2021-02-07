//
//  File.swift
//  Inventoroo
//
//  Created by Eric Tom on 2/5/21.
//

import UIKit
import Foundation

struct CellAttributes {
    var identifier: String
    var title: String
}

// MARK: - TableViewCell
class EmbeddedCollectionTableViewCell: UITableViewCell {
    var collectionView: UICollectionView!
    var collectionViewHeight = NSLayoutConstraint()
        
    static let identifier: String = "embeddedCollectionViewCellId"
    var title: String?
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 70, height: 80)
        collectionView = UICollectionView(frame: contentView.frame, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(CustomCollectionCell.self, forCellWithReuseIdentifier: CustomCollectionCell.identifier)
//        collectionView.register(ChartCollectionCell.self, forCellWithReuseIdentifier: ChartCollectionCell.identifier)
//        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.identifier)
        addSubview(collectionView)
        print("***collection view cell content view width = \(collectionView.frame.width)")
        print("***collection view cell content view width = \(collectionView.frame.height)")
//        collectionViewHeight.constant = 100
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureEmbeddedCollectionView(for collectionCell: AnyClass?, identifier: String) {
        collectionView.register(collectionCell.self, forCellWithReuseIdentifier: identifier)
//        collectionView.delegate = self
//        collectionView.dataSource = self
        addSubview(collectionView)
//        setupViews()
        // Sets the collection view to be within the table views contentView
    }
    
    func dummyConfigure(for number: Int) {
        backgroundColor = number == 0 ? UIColor.blue : UIColor.yellow
        title = number == 0 ? "First Section" : "All Other Sections"
    }
    
    private func setupViews() {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "test")
        imageView.contentMode = .scaleToFill
//        collectionView.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
}

// MARK: - Ext. CollectionView Hooks
extension EmbeddedCollectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        let sectionAttributes = SectionAttributesFactory.createSectionAttributes(for: section)
//        return sectionAttributes.numOfItemsInSection
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionCell.identifier, for: indexPath)
        return cell
//        let sectionAttributes = SectionAttributesFactory.createSectionAttributes(for: indexPath.section)
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: sectionAttributes.reuseIdentifier, for: indexPath)
//        return cell
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////        return CGSize(width: collectionView.frame.size.width/2 - 16 , height: collectionView.frame.size.width/2 + 70)
//        let sectionAttributes = SectionAttributesFactory.createSectionAttributes(for: indexPath.section)
//        return UIDevice.current.orientation.isLandscape ? sectionAttributes.cellLayout.landscapeSize : sectionAttributes.cellLayout.portraitSize
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("you selected section:\(indexPath.section) row:\(indexPath.row)")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10)
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
