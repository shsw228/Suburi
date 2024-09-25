//
//  ScreenPath.swift
//  Training
//  
//  Created by shsw228 on 2024/09/25
//

import SwiftUI

enum ScreenPath: Int {
    case home
    case tappableText

    var title: String {
        String(describing: self)
    }
    @ViewBuilder
    func Destination() -> some View {
        switch self {
        case .home: ContentView()
        case .tappableText: TappableText()
        }
    }
}
