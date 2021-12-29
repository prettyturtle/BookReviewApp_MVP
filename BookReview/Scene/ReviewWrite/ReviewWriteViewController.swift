//
//  ReviewWriteViewController.swift
//  BookReview
//
//  Created by yc on 2021/12/30.
//

import UIKit
import SnapKit

class ReviewWriteViewController: UIViewController {
    
    private lazy var presenter = ReviewWritePresenter(viewController: self)
    
    private lazy var bookTitleButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("책 제목", for: .normal)
        button.setTitleColor(.tertiaryLabel, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = .systemFont(ofSize: 23.0, weight: .bold)
        
        return button
    }()
    
    private lazy var contentsTextView: UITextView = {
        let textView = UITextView()
        
        textView.textColor = .tertiaryLabel
        textView.text = "내용을 입력해주세요."
        textView.font = .systemFont(ofSize: 16.0, weight: .medium)
        textView.delegate = self
        
        return textView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .secondarySystemBackground
        
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

extension ReviewWriteViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .tertiaryLabel else { return }
        
        textView.text = nil
        textView.textColor = .label
    }
}

extension ReviewWriteViewController: ReviewWirteProtocol {
    func setupNavigationItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .close,
            target: self,
            action: #selector(didTapLeftBarButton)
        )
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .save,
            target: self,
            action: #selector(didTapRightBarButton)
        )
    }
    func showCloseAlertSheet() {
        let alertController = UIAlertController(
            title: "작성중인 내용이 있습니다. 정말 닫으시겠습니까?",
            message: nil,
            preferredStyle: .alert
        )
        
        let closeAction = UIAlertAction(
            title: "닫기",
            style: .destructive
        ) { [weak self] _ in
            self?.dismiss(animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(
            title: "취소",
            style: .cancel,
            handler: nil
        )
        
        [closeAction, cancelAction].forEach { alertController.addAction($0) }
        
        present(alertController, animated: true, completion: nil)
    }
    
    func close() {
        // TODO: UserDefaults에 유저가 작성한 리뷰 저장하기
        dismiss(animated: true, completion: nil)
    }
    
    func setupViews() {
        view.backgroundColor = .systemBackground
        
        [
            bookTitleButton,
            contentsTextView,
            imageView
        ].forEach { view.addSubview($0) }
        
        bookTitleButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20.0)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(20.0)
        }
        
        contentsTextView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16.0)
            make.top.equalTo(bookTitleButton.snp.bottom).offset(16.0)
        }
        
        imageView.snp.makeConstraints { make in
            make.leading.equalTo(contentsTextView.snp.leading)
            make.trailing.equalTo(contentsTextView.snp.trailing)
            make.top.equalTo(contentsTextView.snp.bottom).offset(16.0)
            make.height.equalTo(200.0)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}


private extension ReviewWriteViewController {
    @objc func didTapLeftBarButton() {
        presenter.didTapLeftBarButton()
    }
    
    @objc func didTapRightBarButton() {
        presenter.didTapRightBarButton()
    }
}
