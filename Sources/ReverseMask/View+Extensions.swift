//
//  View+Extensions.swift
//
//
//  Created by Kristof Kalai on 2023. 03. 04..
//

import SwiftUI

extension View {
    public func reverseMask<V: View>(alignment: Alignment = .center, _ view: () -> V) -> some View {
        mask(
            Rectangle()
                .overlay(
                    view()
                        .blendMode(.destinationOut),
                    alignment: alignment
                )
        )
    }
}
