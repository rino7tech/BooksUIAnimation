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
    .init(title: "The Alchemist", imageName: "Book1", author: "Paulo Coelho"),
    .init(title: "1984", imageName: "Book2", author: "George Orwell"),
    .init(title: "To Kill a Mockingbird", imageName: "Book3", author: "Harper Lee"),
    .init(title: "The Great Gatsby", imageName: "Book4", author: "F. Scott Fitzgerald"),
    .init(title: "The Hobbit", imageName: "Book5", author: "J.R.R. Tolkien"),
]
