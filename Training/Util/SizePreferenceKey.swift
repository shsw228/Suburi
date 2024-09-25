//
//  SizePreferenceKey.swift
//  Training
//  
//  Created by shsw228 on 2024/09/25
//

import SwiftUI

struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}
