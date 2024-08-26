//
//  AnchorsKey.swift
//  Bible
//
//  Created by Thien.Vu2 on 26/08/2024.
//

import SwiftUI

internal struct AnchorsKey: PreferenceKey {
    static let defaultValue = [Anchor<CGRect>]()
    
    static func reduce(value: inout [Anchor<CGRect>], nextValue: () -> [Anchor<CGRect>]) {
        value.append(contentsOf: nextValue())
    }
}
