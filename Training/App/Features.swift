//
//  Features.swift
//  Training
//  
//  Created by shsw228 on 2024/09/25
//

import Foundation

struct Features: Identifiable {
    let id =  UUID()
    let name: String
    
    var items: [Features]?
    var path: ScreenPath?
    
    // FeatureSectionList
    static let text = Features(name: "Text", items: [Features(path: .tappableText)])

    // FeatureSectionArray
    static let list = [
        text
    ]
}
extension Features {
    init(path: ScreenPath) {
        self.name = path.title
        self.path = path
    }
}
