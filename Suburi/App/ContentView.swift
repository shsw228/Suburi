//
//  ContentView.swift
//  Training
//  
//  Created by shsw228 on 2024/09/18
//

import SwiftUI

struct ContentView: View {
    @State private var path: NavigationPath = NavigationPath()
    let contents = Features.list

    var body: some View {
        NavigationStack(path: $path) {
            List(contents, children: \.items) {item in
                NavigationLink(item.name, value: item.path)
            }
            .navigationTitle(ScreenPath.home.title)
            .navigationDestination(for: ScreenPath.self) { path in
                path.Destination()
                    .navigationTitle(path.title)
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    ContentView()
}
