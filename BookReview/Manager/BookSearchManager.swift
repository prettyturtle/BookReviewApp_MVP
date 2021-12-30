//
//  BookSearchManager.swift
//  BookReview
//
//  Created by yc on 2021/12/30.
//

import Alamofire
import Foundation

struct BookSearchManager {
    func request(from keyword: String, completionHandler: @escaping (([Book]) -> Void)) {
        guard let url = URL(string: "https://openapi.naver.com/v1/search/book.json") else { return }
        
        let parameters = BookSearchRequestModel(query: keyword)
        
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id": "X_RhhFdos_T8XyYZbYq7",
            "X-Naver-Client-Secret": "1Iq3eupG69"
        ]

        AF
            .request(url, method: .get, parameters: parameters, headers: headers)
            .responseDecodable(of: BookSearchResponseModel.self) { response in
                switch response.result {
                case .success(let result):
                    completionHandler(result.items)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            .resume()
    }
}
