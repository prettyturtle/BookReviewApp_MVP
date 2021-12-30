//
//  BookSearchRequestModel.swift
//  BookReview
//
//  Created by yc on 2021/12/30.
//

import Foundation

struct BookSearchRequestModel: Codable {
    /// 검색할 책 키워드
    let query: String
}
