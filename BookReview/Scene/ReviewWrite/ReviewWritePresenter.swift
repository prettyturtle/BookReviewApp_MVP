//
//  ReviewWritePresenter.swift
//  BookReview
//
//  Created by yc on 2021/12/30.
//

import UIKit

protocol ReviewWirteProtocol {
    func setupNavigationItem()
    func showCloseAlertSheet()
    func close()
    func setupViews()
}

class ReviewWritePresenter {
    private let viewController: ReviewWirteProtocol
    
    init(viewController: ReviewWirteProtocol) {
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
}
