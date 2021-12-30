//
//  BookReview.swift
//  BookReview
//
//  Created by yc on 2021/12/30.
//

import Foundation

struct BookReview: Codable {
    let title: String
    let contents: String
    let imageURL: URL?
}
