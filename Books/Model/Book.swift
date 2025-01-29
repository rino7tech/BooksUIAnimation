//
//  Book.swift
//  Books
//
//  Created by 伊藤璃乃 on 2025/01/24.
//

import Foundation

struct Book: Identifiable,Hashable {
    var id: String = UUID().uuidString
    var title: String
    var imageName: String
    var author: String
}


var sampleBooks: [Book] = [
    .init(title: "ひとつめ", imageName: "Book1", author: "ひとりめ"),
    .init(title: "ふたつめ", imageName: "Book2", author: "ふたりめ"),
    .init(title: "みっつめ", imageName: "Book3", author: "さんにんめ"),
    .init(title: "よっつめ", imageName: "Book4", author: "よにんめ"),
    .init(title: "いつつめ", imageName: "Book5", author: "ごにんめ"),
]
