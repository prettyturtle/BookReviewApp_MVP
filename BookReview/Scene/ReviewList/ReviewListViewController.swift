//
//  ReviewListViewController.swift
//  BookReview
//
//  Created by yc on 2021/12/29.
//

import UIKit
import SnapKit

class ReviewListViewController: UIViewController {
    
    private lazy var presenter = ReviewListPresenter(viewController: self)

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.dataSource = presenter
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear()
    }


}

extension ReviewListViewController: ReviewListProtocol {
    func setupNavigationBar() {
        navigationItem.title = "도서 리뷰"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(didTapRightBarButtonItem)
        )
    }
    
    func setupViews() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func presentToReviewWriteViewController() {
        let vc = UINavigationController(rootViewController: ReviewWriteViewController())
        
        vc.modalPresentationStyle = .fullScreen
        
        present(vc, animated: true)
    }
    
    func reloadTableView() {
        tableView.reloadData()
        print("reloadTableView() is called!! ")
    }
    
}

private extension ReviewListViewController {
    @objc func didTapRightBarButtonItem() {
        presenter.didTapRightBarButtonItem()
    }
}
