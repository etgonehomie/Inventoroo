//
//  File.swift
//  Inventoroo
//
//  Created by Eric Tom on 2/5/21.
//

import UIKit
import Foundation

class EmbeddedCollectionViewCell: UITableViewCell {
    static let identifier: String = "embeddedCollectionViewCellId"
    var title: String?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(for collectionView: UICollectionView, with title: String) {
        self.title = title
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
        addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
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
