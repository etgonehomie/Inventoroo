//
//  StackViewController.swift
//  Inventoroo
//
//  Created by Eric Tom on 2/5/21.
//

import UIKit

class StackViewController: UIViewController {
    var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        
        
        let productView = UICollectionView(frame: frame, collectionViewLayout: layout)
        let chartView = UICollectionView(frame: frame, collectionViewLayout: layout)
        chartView.backgroundColor = .yellow
        productView.backgroundColor = .brown
        
        let stackView = UIStackView(arrangedSubviews: [chartView, productView])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        // create 2 views that take up half the screen if portrait and full if landscape
        // add the view to stack view
        
    }
}
