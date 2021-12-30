//
//  BookSearchResponseModel.swift
//  BookReview
//
//  Created by yc on 2021/12/30.
//

import Foundation

struct BookSearchResponseModel: Decodable {
    var items: [Book] = []
}

