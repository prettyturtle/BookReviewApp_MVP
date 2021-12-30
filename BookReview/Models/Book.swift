//
//  Book.swift
//  BookReview
//
//  Created by yc on 2021/12/30.
//

import Foundation

struct Book: Decodable {
    let title: String
    private let image: String?
    
    var imageURL: URL? { URL(string: image ?? "") }
}
