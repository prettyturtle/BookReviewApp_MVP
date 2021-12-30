//
//  ReviewWritePresenter.swift
//  BookReview
//
//  Created by yc on 2021/12/30.
//

import UIKit

protocol ReviewWriteProtocol {
    func setupNavigationItem()
    func showCloseAlertSheet()
    func close()
    func setupViews()
    func presentToSearchBookViewController()
    func updateViews(title: String, imageURL: URL?)
}

class ReviewWritePresenter {
    private let viewController: ReviewWriteProtocol
    
    private let userDefaultsManager = UserDefaultsManager()
    private var book: Book?
    
    let contentsTextViewPlaceholderText = "내용을 입력해주세요."
    
    init(viewController: ReviewWriteProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController.setupNavigationItem()
        viewController.setupViews()
    }
    
 
    
    func didTapLeftBarButton() {
        viewController.showCloseAlertSheet()
    }
    
    func didTapRightBarButton(contentsText: String) {
        guard let book = book,
              contentsText != contentsTextViewPlaceholderText else { return }
        
        let bookReview = BookReview(title: book.title, contents: contentsText, imageURL: book.imageURL)
        
        userDefaultsManager.setReview(bookReview)
        viewController.close()
    }
    
    func didTapBookTitleButton() {
        viewController.presentToSearchBookViewController()
    }
}

extension ReviewWritePresenter: SearchBookDelegate {
    func selectBook(_ book: Book) {
        self.book = book
        viewController.updateViews(title: book.title, imageURL: book.imageURL)
    }
}
