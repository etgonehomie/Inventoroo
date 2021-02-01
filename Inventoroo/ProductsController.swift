//
//  ProductController.swift
//  Inventoroo
//
//  Created by Eric Tom on 1/29/21.
//

import UIKit

// TODO: FIX THIS SO THAT THERE is a SectionFactory to define all the cell varialbes for a given section
protocol SectionAttributes {
    var type: SectionType { get }
    var numOfItemsInSection: Int { get }
    var itemSize: CGSize { get }
    var reuseIdentifier: String { get }
}

struct ChartSection: SectionAttributes {
    
    var type: SectionType { .chartSection }
    
    var numOfItemsInSection: Int { 1 }
    
    var itemSize: CGSize { CGSize(width: 100, height: 100) }
    
    var reuseIdentifier: String { ChartCell.reuseIdentifier }
    
    
}

struct ProductsSection: SectionAttributes {
    var type: SectionType { .productsSection }
    
    var numOfItemsInSection: Int { 5 }
    
    var itemSize: CGSize { CGSize(width: 100, height: 100) }
    
    var reuseIdentifier: String { ProductCell.reuseIdentifier }
    
    
}

enum SectionType: Int {
    case chartSection
    case productsSection
}


class ProductsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .green
        collectionView.alwaysBounceVertical = true
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.reuseIdentifier)
        collectionView.register(ChartCell.self, forCellWithReuseIdentifier: ChartCell.reuseIdentifier)
    }
    
    // MARK: - Collection Controller Methods
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch SectionType(rawValue: section) {
        case .chartSection:
            return 1
        default:
            return 5
        }
    }
    
    // TODO: - Need to refactor so that we dont have all these switch statements littered throughout all the functions
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reuseIdentifer: String
        switch SectionType(rawValue: indexPath.section) {
        case .chartSection:
            reuseIdentifer = ChartCell.reuseIdentifier
        default:
            reuseIdentifer = ProductCell.reuseIdentifier
        }
                
        return collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifer, for: indexPath)
    }
    
//    override func collectionView(_ collectionView: UICollectionView, transitionLayoutForOldLayout fromLayout: UICollectionViewLayout, newLayout toLayout: UICollectionViewLayout) -> UICollectionViewTransitionLayout {
//        <#code#>
//    }
    
    
    // MARK: - Delegate Flow Layout Methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let cell: CellLayout
        switch SectionType(rawValue: indexPath.section) {
        case .chartSection:
            cell = ChartCell(frame: view.frame)
        default:
            cell = ProductCell(frame: view.frame)
        }
        
        // TODO: - Fix this deprecated function
        return UIApplication.shared.statusBarOrientation.isLandscape ? cell.landscapeSize : cell.portraitSize
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
}

