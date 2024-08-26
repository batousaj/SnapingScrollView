//
//  OnUpdate.swift
//  Bible
//
//  Created by Thien.Vu2 on 26/08/2024.
//

import Combine
import SwiftUI

internal extension View {
    @ViewBuilder @inlinable func onUpdate<V>(of value: V, perform action: @escaping (_ newValue: V) -> Void) -> some View
    where V : Equatable
    {
        if #available(iOS 14.0, *) {
            onChange(of: value, perform: action)
        } else {
            onReceive(Just(value), perform: action)
        }
    }
}
