//
//  MainTableView.swift
//  Inventoroo
//
//  Created by Eric Tom on 2/4/21.
//

import UIKit

class MainTableView: UITableView {

    override var backgroundColor: UIColor? {
        get {.red }
        set { super.backgroundColor = newValue }
    }
    
    override var translatesAutoresizingMaskIntoConstraints: Bool {
        get { false }
        set { super.translatesAutoresizingMaskIntoConstraints = newValue }
    }
    
    func configure(on view: UIView) {
        register(MainTableCell.self, forCellReuseIdentifier: MainTableCell.identifier)
//        guard let superview = superview else { return }
        view.addSubview(self)
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalTo: view.widthAnchor),
            heightAnchor.constraint(equalTo: view.heightAnchor),
            centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
