//
//  ScrollPositions.swift
//  Suburi
//
//  Created by shsw228 on 2024/09/28
//

import SwiftUI

struct ScrollPositions: View {

    @State private var currentVerticalColor: Color?
    @State private var currentHorizontalColor: Color?

    init() {
        _currentVerticalColor = State(initialValue: .green)
        _currentHorizontalColor = State(initialValue: .green)
    }

    var body: some View {
        VStack {
            VStack(alignment: .center) {
                ScrollVerticalPositions(color: $currentVerticalColor)
                ScrollHorizontalPositions(color: $currentHorizontalColor)
            }
            Button {
                withAnimation {
                    currentVerticalColor = .orange
                    currentHorizontalColor = .orange
                }
            } label: {
                Text(verbatim: "Go to orange")
            }
        }
    }
}

struct ScrollVerticalPositions: View {
    var items: [Color] = [.green, .blue, .purple, .pink, .yellow, .orange]
    @Binding var color: Color?
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                VStack(spacing: 0) {
                    ForEach(items, id: \.self) { item in
                        RoundedRectangle(cornerRadius: 15)
                            .fill(item)
                            .padding()
                            .containerRelativeFrame(.vertical)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.paging)
            .scrollPosition(id: $color)
            Text(verbatim: "\(color?.description.capitalized ?? "None")")
        }
    }
}
struct ScrollHorizontalPositions: View {
    var items: [Color] = [.green, .blue, .purple, .pink, .yellow, .orange]
    @Binding var color: Color?
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(items, id: \.self) { item in
                        RoundedRectangle(cornerRadius: 15)
                            .fill(item)
                            .padding()
                            .containerRelativeFrame(.horizontal)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.paging)
            .scrollPosition(id: $color)
            Text(verbatim: "\(color?.description.capitalized ?? "None")")
        }
    }
}
#Preview {
    ScrollPositions()
}
