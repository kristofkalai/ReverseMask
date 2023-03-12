//
//  ContentView.swift
//  Example
//
//  Created by Kristóf Kálai on 2023. 03. 04..
//

import SwiftUI
import ReverseMask

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            VStack {
                content(for: .red.opacity(0.6))
                Spacer()
                    .frame(height: 50)
                content(for: .clear)
            }
            .padding()
            .background(.green)
            Spacer()
        }
    }

    private func content(for color: Color) -> some View {
        VStack(spacing: .zero) {
            Text("With reverse mask:")
            Color.black
                .reverseMask {
                    image
                }
                .overlay {
                    image
                        .foregroundColor(color)
                }
                .frame(width: 200, height: 100)

            Text("Without reverse mask:")
            ZStack {
                image
                    .foregroundColor(color)
            }
            .frame(width: 200, height: 100)
            .background(.black)
        }
    }

    private var image: some View {
        Image(systemName: "circle")
            .renderingMode(.template)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 50)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
