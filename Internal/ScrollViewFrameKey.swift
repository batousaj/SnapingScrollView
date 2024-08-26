//
//  ScrollViewFrameKey.swift
//  Bible
//
//  Created by Thien.Vu2 on 26/08/2024.
//

import SwiftUI

internal extension EnvironmentValues {
    var scrollViewFrame: CGRect? {
        get { self[ScrollViewFrameKey.self] }
        set { self[ScrollViewFrameKey.self] = newValue }
    }
}

private struct ScrollViewFrameKey: EnvironmentKey {
    static let defaultValue: CGRect? = nil
}
