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
    let reuseIdentifier = ChartCollectionCell.identifier
    var numOfItemsInSection = 1
    
    // MARK: - Computed Properties
    var cellLayout: CellLayout { ChartCollectionCell() }
}

struct ProductsSection: SectionAttributes {
    
    init(sectionPosition: Int) {
        sectionId = sectionPosition
    }
    
    var sectionId: Int
    let type: SectionType = .productsSection
    let reuseIdentifier = ProductCell.identifier
    var numOfItemsInSection =  5
    
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
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.identifier)
        collectionView.register(ChartCollectionCell.self, forCellWithReuseIdentifier: ChartCollectionCell.identifier)
        
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
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { context in
            self.collectionView.collectionViewLayout.invalidateLayout()
        })
    }
    
    // MARK: - Delegate Flow Layout Methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sectionAttributes = SectionAttributesFactory.createSectionAttributes(for: indexPath.section)
        return UIDevice.current.orientation.isLandscape ? sectionAttributes.cellLayout.landscapeSize : sectionAttributes.cellLayout.portraitSize
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
}

