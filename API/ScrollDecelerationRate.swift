//
//  ScrollDecelerationRate.swift
//  Bible
//
//  Created by Thien.Vu2 on 26/08/2024.
//

import UIKit

/// A floating-point value that determines the rate of deceleration after
/// the user ends dragging in a scrolling view.
public enum ScrollDecelerationRate: Hashable, CaseIterable {
    
    /// The default deceleration rate.
    case normal
    
    /// A fast deceleration rate.
    case fast
}

internal extension ScrollDecelerationRate {
    var rate: UIScrollView.DecelerationRate {
        switch self {
        case .normal: return .normal
        case .fast: return .fast
        }
    }
}
