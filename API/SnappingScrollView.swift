//
//  AnchorsKey.swift
//  Bible
//
//  Created by Thien.Vu2 on 26/08/2024.
//

import SwiftUI

public struct SnappingScrollView<Content>: View where Content : View {
    
    @StateObject private var delegate = SnappingScrollViewDelegate()
    @State private var frame: CGRect? = nil
    
    private var axis: Axis
    private var content: () -> Content
    private var decelerationRate: ScrollDecelerationRate
    private var showsIndicators: Bool
    
    init(_ axis: Axis = .vertical,
         decelerationRate: ScrollDecelerationRate = .normal,
         showsIndicators: Bool = true,
         @ViewBuilder content: @escaping () -> Content) {
        self.axis = axis
        self.content = content
        self.decelerationRate = decelerationRate
        self.showsIndicators = showsIndicators
    }
    
    public var body: some View {
        ScrollView(axis.set, showsIndicators: showsIndicators) {
            Group {
                switch axis {
                case .horizontal:
                    HStack(content: content)
                case .vertical:
                    VStack(content: content)
                }
            }
            .environment(\.scrollViewFrame, frame)
            .backgroundPreferenceValue(AnchorsKey.self) { anchors in
                GeometryReader { geometry in
                    let frames = anchors.map { geometry[$0] }
                    
                    Color.clear
                        .onAppear { delegate.frames = frames }
                        .onUpdate(of: frames) { delegate.frames = $0 }
                }
                .hidden()
            }
            .transformPreference(AnchorsKey.self) { $0 = AnchorsKey.defaultValue }
            .background(UIScrollViewBridge(decelerationRate: decelerationRate.rate, delegate: delegate))
        }
        .background(
            GeometryReader { geometry in
                Color.clear
                    .onAppear {
                        DispatchQueue.main.async {
                            if frame == nil {
                                frame = geometry.frame(in: .global)
                            }
                        }
                    }
                    .onUpdate(of: geometry.frame(in: .global)) {
                        frame = $0
                    }
            }
            .ignoresSafeArea()
            .hidden()
        )
    }
}
