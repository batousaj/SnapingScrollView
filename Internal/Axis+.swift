//
//  Axis+.swift
//  Bible
//
//  Created by Thien.Vu2 on 26/08/2024.
//

import SwiftUI

internal extension Axis {
    var set: Axis.Set {
        switch self {
        case .horizontal: return .horizontal
        case .vertical: return .vertical
        }
    }
}

