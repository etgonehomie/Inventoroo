//
//  ProductController.swift
//  Inventoroo
//
//  Created by Eric Tom on 1/29/21.
//

import UIKit

class SectionAttributesFactory {
    
    static func createSectionAttributes(for section: Int) -> SectionAttributes {
        switch section {
        case 0:
            return ChartSection(sectionPosition: section)
        default:
            return ProductsSection(sectionPosition: section)
        }
    }
}

protocol SectionAttributes {
    var type: SectionType { get }
    var sectionId: Int { get }
    var numOfItemsInSection: Int { get }
    var reuseIdentifier: String { get }
    var cellLayout: CellLayout { get }
}

struct ChartSection: SectionAttributes {
    
    init(sectionPosition: Int) {
        sectionId = sectionPosition
    }
    
    var sectionId: Int
    let type: SectionType = .chartSection
    let reuseIdentifier = ChartCell.reuseIdentifier
    var numOfItemsInSection = 1
    
    // MARK: - Computed Properties
    var cellLayout: CellLayout { ChartCell() }
}

struct ProductsSection: SectionAttributes {
    
    init(sectionPosition: Int) {
        sectionId = sectionPosition
    }
    
    var sectionId: Int
    let type: SectionType = .productsSection
    let reuseIdentifier = ProductCell.reuseIdentifier
    var numOfItemsInSection =  1
    
    // MARK: - Computed Properties
    var cellLayout: CellLayout { ProductCell() }
}

enum SectionType: Int {
    case chartSection
    case productsSection
}

class HomePageViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .green
        collectionView.alwaysBounceVertical = true
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.reuseIdentifier)
        collectionView.register(ChartCell.self, forCellWithReuseIdentifier: ChartCell.reuseIdentifier)
        
        NotificationCenter.default.addObserver(self, selector: #selector(HomePageViewController.rotated), name: NSNotification.Name.init(rawValue: "Device rotated"), object: nil)
    }
    
    @objc func rotated() {
        collectionView.reloadData()
    }
    
    // MARK: - Collection Controller Methods
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionAttributes = SectionAttributesFactory.createSectionAttributes(for: section)
        return sectionAttributes.numOfItemsInSection
    }
    
    // TODO: - Need to refactor so that we dont have all these switch statements littered throughout all the functions
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionAttributes = SectionAttributesFactory.createSectionAttributes(for: indexPath.section)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: sectionAttributes.reuseIdentifier, for: indexPath)
        cell.contentView.largeContentTitle = "Hello world"
        return cell
    }
    
//    override func collectionView(_ collectionView: UICollectionView, transitionLayoutForOldLayout fromLayout: UICollectionViewLayout, newLayout toLayout: UICollectionViewLayout) -> UICollectionViewTransitionLayout {
//        <#code#>
//    }
    
    // TODO: - https://medium.com/@andrea.toso/uicollectionviewcell-dynamic-height-swift-b099b28ddd23
    // might be able to use the above to properly change cell size on rotate. The URL says to use the 2 funcs below
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    // MARK: - Delegate Flow Layout Methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sectionAttributes = SectionAttributesFactory.createSectionAttributes(for: indexPath.section)

        if UIDevice.current.orientation.isLandscape {
            print("Section: \(sectionAttributes.type) | lanscape: \(sectionAttributes.cellLayout.landscapeSize.width)")
        } else {
            print("Section: \(sectionAttributes.type) | portrait: \(sectionAttributes.cellLayout.portraitSize.width)")
        }

        return UIDevice.current.orientation.isLandscape ? sectionAttributes.cellLayout.landscapeSize : sectionAttributes.cellLayout.portraitSize
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
}

