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
    let storyTitleTextField = UnderLineTextField()
    let storyContentTextView = TextView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.isTranslucent = false
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
        storyTitleTextField.setPlaceholder(placeholder: "제목을 입력해주세요", color: .SSGray2)
        storyTitleTextField.tintColor = .SSRed
        writeStoryScrollView.addSubview(storyTitleTextField)
        storyTitleTextField.snp.makeConstraints { make in
            make.top.equalTo(categoryButton.snp.bottom).inset(-27)
            make.left.right.equalTo(self.view).inset(25)
        }
        
        // 작성 가이드
        let guideView = GuideView()
        writeStoryScrollView.addSubview(guideView)
        guideView.snp.makeConstraints { make in
            make.top.equalTo(storyTitleTextField.snp.bottom).inset(-11)
            make.left.right.equalTo(self.view).inset(13)
        }
        
        // 본문 요약
        let storySummaryLabel = UILabel()
        storySummaryLabel.attributedText = .attributeFontStyle(font: .SSSemiBold, size: 13, text: "본문 요약", lineHeight: 22)
        writeStoryScrollView.addSubview(storySummaryLabel)
        storySummaryLabel.snp.makeConstraints { make in
            make.top.equalTo(guideView.snp.bottom).inset(-18)
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
        
        let storySummaryTextView = TextView()
        storySummaryTextView.setPlaceHolder(placeholder: "본문 요약글을 입력해주세요")
        writeStoryScrollView.addSubview(storySummaryTextView)
        storySummaryTextView.snp.makeConstraints { make in
            make.left.right.equalTo(self.view).inset(25)
            make.top.equalTo(storySummaryLabel.snp.bottom).inset(-7)
            make.height.equalTo(167.adjustWidth)
        }
        
        let storySummaryUnderLineView = UIView()
        storySummaryUnderLineView.backgroundColor = .SSGray2
        writeStoryScrollView.addSubview(storySummaryUnderLineView)
        storySummaryUnderLineView.snp.makeConstraints { make in
            make.top.equalTo(storySummaryTextView.snp.bottom)
            make.height.equalTo(1)
            make.left.right.equalTo(self.view).inset(25)
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
        
        storyContentTextView.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 354.adjustWidth)
        storyContentTextView.setPlaceHolder(placeholder: "본문 내용을 입력해주세요")
        storyContentTextView.isScrollEnabled = false
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
            make.height.equalTo(236.adjustWidth + bottomPadding)
            make.bottom.equalToSuperview().inset(bottomPadding)
        }
        
        let pointInfoTitle = UILabel()
        pointInfoTitle.attributedText = .attributeFontStyle(font: .SSSemiBold, size: 12, text: "포인트 안내", lineHeight: 22)
        pointInfoTitle.textColor = .SSGray5
        footerView.addSubview(pointInfoTitle)
        pointInfoTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(22)
            make.left.right.equalToSuperview().inset(25)
        }
        
        let pointString = """
        · 경험글을 작성했을 경우 350 포인트가 지급됩니다.
        · 다른 사람이 경험글을 구매 했을 경우 건당 200포인트씩 지급됩니다.
        """
        let pointInfo = UILabel()
        pointInfo.numberOfLines = 2
        pointInfo.attributedText = .attributeFontStyle(font: .SSSemiBold, size: 10, text: pointString, lineHeight: 17)
        pointInfo.textColor = .SSGray5
        footerView.addSubview(pointInfo)
        pointInfo.snp.makeConstraints { make in
            make.top.equalTo(pointInfoTitle.snp.bottom).inset(-5)
            make.left.right.equalToSuperview().inset(25)
        }
        
        let noteTitle = UILabel()
        noteTitle.attributedText = .attributeFontStyle(font: .SSSemiBold, size: 12, text: "유의사항", lineHeight: 22)
        noteTitle.textColor = .SSGray5
        footerView.addSubview(noteTitle)
        noteTitle.snp.makeConstraints { make in
            make.top.equalTo(pointInfo.snp.bottom).inset(-14)
            make.left.right.equalToSuperview().inset(25)
        }
        
        let noteString = """
        · 경험글의 구매 이력이 있을 경우 수정/삭제가 불가능합니다.
        · 신고가 여러번 접수 되었을 경우 작성자의 동의 없이 숨김처리가 될 수 있습니다.
        """
        let noteInfo = UILabel()
        noteInfo.numberOfLines = 2
        noteInfo.attributedText = .attributeFontStyle(font: .SSSemiBold, size: 10, text: noteString, lineHeight: 17)
        noteInfo.textColor = .SSGray5
        footerView.addSubview(noteInfo)
        noteInfo.snp.makeConstraints { make in
            make.top.equalTo(noteTitle.snp.bottom).inset(-5)
            make.left.right.equalToSuperview().inset(25)
        }
        
        let doneButton = MainButton()
        doneButton.setAttributedTitle(.attributeFontStyle(font: .SSBold, size: 15, text: "완료", lineHeight: 24), for: .normal)
        doneButton.setTitleColor(.white, for: .normal)
        footerView.addSubview(doneButton)
        doneButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            make.top.equalTo(noteInfo.snp.bottom).inset(-47.adjustWidth)
        }
    }
}
