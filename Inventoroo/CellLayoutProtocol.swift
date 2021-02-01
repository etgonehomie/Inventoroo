//
//  CellLayoutProtocol.swift
//  Inventoroo
//
//  Created by Eric Tom on 1/31/21.
//

import struct CoreGraphics.CGSize

protocol CellLayout {
    var landscapeSize: CGSize { get }
    var portraitSize: CGSize { get }
}
