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
    
    func didTapRightBarButton() {
        viewController.close()
    }
    
    func didTapBookTitleButton() {
        viewController.presentToSearchBookViewController()
    }
}

extension ReviewWritePresenter: SearchBookDelegate {
    func selectBook(_ book: Book) {
        viewController.updateViews(title: book.title, imageURL: book.imageURL)
    }
}
