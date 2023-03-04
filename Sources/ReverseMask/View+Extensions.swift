//
//  View+Extensions.swift
//  
//
//  Created by Kristof Kalai on 2023. 03. 04..
//

import SwiftUI

extension View {
    @available(iOS 15.0, *)
    public func reverseMask<V: View>(alignment: Alignment = .center, @ViewBuilder _ view: () -> V) -> some View {
        mask {
            Rectangle()
                .overlay(alignment: alignment) {
                    view()
                        .blendMode(.destinationOut)
                }
        }
    }

    public func reverseMask<V: View>(alignment: Alignment = .center, _ view: V) -> some View {
        mask(
            Rectangle()
                .overlay(
                    view
                        .blendMode(.destinationOut),
                    alignment: alignment
                )
        )
    }
}
