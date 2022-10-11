//
//  WriteExperienceViewController.swift
//  SellStroy-iOS
//
//  Created by minimani on 2022/10/02.
//

import UIKit

import DropDown

class WriteStoryViewController: UIViewController {

    let writeStoryScrollView = UIScrollView()
    let dropDown = DropDown()
    let categoryBadge = CategoryBadgeView(type: .lifeStyle)
    let categoryLabel = UILabel()
    let arrowDownImageView = UIImageView(image: UIImage(named: "down_arrow_ic"))
    let storyContentTextView = UITextView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.backgroundColor = .white
        Singleton.shared.changeStatusBarColor(backgroundColor: .white)
        self.title = "경험쓰기"
        
        let leftBarItem = UIBarButtonItem(image: UIImage(named: "back_ic")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(selectBackButton))
        self.navigationItem.leftBarButtonItem = leftBarItem
        
        setUpView()
        setUpFooterView()
    }
    
    @objc func selectBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func selectCategoryButton() {
        dropDown.show()
    }
    
    func setUpView() {
        
        writeStoryScrollView.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        writeStoryScrollView.contentSize = .init(width: writeStoryScrollView.frame.width, height: writeStoryScrollView.frame.height)
        self.view.addSubview(writeStoryScrollView)
     
        let categoryButton = UIButton()
        writeStoryScrollView.addSubview(categoryButton)
        
        categoryLabel.attributedText = .attributeFontStyle(font: .SSBold, size: 13, text: "카테고리 선택", lineHeight: 22)
        categoryButton.addSubview(categoryLabel)
        categoryLabel.snp.makeConstraints { make in
            make.top.left.equalToSuperview()
        }
        
        categoryBadge.isHidden = true
        categoryButton.addSubview(categoryBadge)
        categoryBadge.snp.makeConstraints { make in
            make.top.left.equalToSuperview()
        }
        
        categoryButton.addSubview(arrowDownImageView)
        arrowDownImageView.snp.makeConstraints { make in
            make.left.equalTo(categoryLabel.snp.right).inset(-3)
            make.top.bottom.equalToSuperview()
            make.height.width.equalTo(18)
        }
        categoryButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(36)
            make.left.right.equalTo(self.view).inset(24)
            make.height.equalTo(18)
        }
        categoryButton.addTarget(self, action: #selector(selectCategoryButton), for: .touchUpInside)
        
        // DropDown 세팅
        dropDown.dataSource = ["일상생활", "취업준비", "면접", "회사생활", "진로", "꿀팁"]
        dropDown.anchorView = categoryButton
        dropDown.width = 100
        dropDown.backgroundColor = .white
        dropDown.cornerRadius = 5
        dropDown.selectionAction = {(index: Int, item: String) in
            print("\(item) \(index)")
            self.categoryBadge.isHidden = false
            self.categoryLabel.isHidden = true
            self.categoryBadge.replayType(type: CategoryType(rawValue: item) ?? .lifeStyle)
            self.arrowDownImageView.snp.remakeConstraints { make in
                make.left.equalTo(self.categoryBadge.snp.right).inset(-9)
            }
        }
        
        // 제목
        let storyTitleTextField = UnderLineTextField()
        storyTitleTextField.setPlaceholder(placeholder: "제목을 입력해주세요", color: .SSGray2)
        storyTitleTextField.tintColor = .SSRed
        writeStoryScrollView.addSubview(storyTitleTextField)
        storyTitleTextField.snp.makeConstraints { make in
            make.top.equalTo(categoryButton.snp.bottom).inset(-27)
            make.left.right.equalTo(self.view).inset(25)
        }
        
        // 본문 요약
        let storySummaryLabel = UILabel()
        storySummaryLabel.attributedText = .attributeFontStyle(font: .SSSemiBold, size: 13, text: "본문 요약", lineHeight: 22)
        writeStoryScrollView.addSubview(storySummaryLabel)
        storySummaryLabel.snp.makeConstraints { make in
            make.top.equalTo(storyTitleTextField.snp.bottom).inset(-23)
            make.left.equalToSuperview().inset(25)
        }
        
        let storySummaryDescriptionLabel = UILabel()
        storySummaryDescriptionLabel.attributedText = .attributeFontStyle(font: .SSSemiBold, size: 11, text: "내 경험을 어필하는 글을 작성해주세요!", lineHeight: 11)
        storySummaryDescriptionLabel.textColor = .SSGray2
        writeStoryScrollView.addSubview(storySummaryDescriptionLabel)
        storySummaryDescriptionLabel.snp.makeConstraints { make in
            make.left.equalTo(storySummaryLabel.snp.right).inset(-5)
            make.top.equalTo(storySummaryLabel.snp.top).inset(2)
        }
        
        let storySummaryTextView = UITextView()
        storySummaryTextView.backgroundColor = .systemBlue
        writeStoryScrollView.addSubview(storySummaryTextView)
        storySummaryTextView.snp.makeConstraints { make in
            make.left.right.equalTo(self.view).inset(25)
            make.top.equalTo(storySummaryLabel.snp.bottom).inset(-7)
            make.height.equalTo(167.adjustWidth)
        }
        
        // 본문 내용
        let storyContentLabel = UILabel()
        storyContentLabel.attributedText = .attributeFontStyle(font: .SSSemiBold, size: 13, text: "본문 내용", lineHeight: 22)
        writeStoryScrollView.addSubview(storyContentLabel)
        storyContentLabel.snp.makeConstraints { make in
            make.top.equalTo(storySummaryTextView.snp.bottom).inset(-8)
            make.left.equalToSuperview().inset(25)
        }
        
        let storyContentDescriptionLabel = UILabel()
        storyContentDescriptionLabel.attributedText = .attributeFontStyle(font: .SSSemiBold, size: 11, text: "위의 작성 가이드를 참고하여 작성해주세요!", lineHeight: 11)
        storyContentDescriptionLabel.textColor = .SSGray2
        writeStoryScrollView.addSubview(storyContentDescriptionLabel)
        storyContentDescriptionLabel.snp.makeConstraints { make in
            make.left.equalTo(storyContentLabel.snp.right).inset(-5)
            make.top.equalTo(storyContentLabel.snp.top).inset(2)
        }
        
        storyContentTextView.delegate = self
        storyContentTextView.isScrollEnabled = false
        storyContentTextView.backgroundColor = .systemBlue
        writeStoryScrollView.addSubview(storyContentTextView)
        storyContentTextView.snp.makeConstraints { make in
            make.left.right.equalTo(self.view).inset(25)
            make.top.equalTo(storyContentLabel.snp.bottom).inset(-7)
            make.height.equalTo(354.adjustWidth)
        }
    }
    
    func setUpFooterView() {
        let footerView = UIView()
        footerView.backgroundColor = .SSGray1
        writeStoryScrollView.addSubview(footerView)
        footerView.snp.makeConstraints { make in
            make.left.right.equalTo(self.view)
            make.top.equalTo(storyContentTextView.snp.bottom)
            make.height.equalTo(236.adjustWidth)
            make.bottom.equalToSuperview()
        }
        
        let doneButton = MainButton()
        doneButton.setAttributedTitle(.attributeFontStyle(font: .SSBold, size: 15, text: "완료", lineHeight: 24), for: .normal)
        doneButton.setTitleColor(.white, for: .normal)
        footerView.addSubview(doneButton)
        doneButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
    }
}

extension WriteStoryViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let size: CGSize = .init(width: self.view.frame.height, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        
        textView.constraints.forEach { constraint in
            if estimatedSize.height <= 354 {
                
            } else {
                if constraint.firstAttribute == .height {
                    constraint.constant = estimatedSize.height
                }
            }
        }
    }
}
