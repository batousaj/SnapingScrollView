//
//  EdgeInsets+.swift
//  Bible
//
//  Created by Thien.Vu2 on 26/08/2024.
//

import SwiftUI

internal extension EdgeInsets {
    func negated() -> EdgeInsets {
        var insets = self
        insets.negate()
        return insets
    }
}
