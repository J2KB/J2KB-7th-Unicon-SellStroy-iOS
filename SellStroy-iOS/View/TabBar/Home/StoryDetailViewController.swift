//
//  ExperienceDetailViewController.swift
//  SellStroy-iOS
//
//  Created by minimani on 2022/10/06.
//

import UIKit

class StoryDetailViewController: UIViewController {
    
    let storyContentScrollView = UIScrollView()
    let separatorView = UIView()
    let lockContentView = LockContentView()
    let sellButton = MainButton()
    
    let bottomViewHeight = 57 + bottomPadding

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backgroundColor = .white
        Singleton.shared.changeStatusBarColor(backgroundColor: .white)
        self.view.backgroundColor = .white
        
        let leftBarItem = UIBarButtonItem(image: UIImage(named: "back_ic")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(selectBackButton))
        self.navigationItem.leftBarButtonItem = leftBarItem
        
        let rightBarItem = UIBarButtonItem(image: UIImage(named: "option_ic")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = rightBarItem
        
        setUpView()
        setUpBottomView()
        checkPurchaseStory()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        checkPurchaseStory()
    }
    
    @objc func selectBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func selectSellButton() {
        let purchaseStoryViewController = PurchaseStoryViewController()
        self.navigationController?.pushViewController(purchaseStoryViewController, animated: true)
    }
    
    func checkPurchaseStory() {
        if UserDefaults.standard.bool(forKey: "purchase") {
            lockContentView.isHidden = true
            storyContentScrollView.isScrollEnabled = true
            
            sellButton.backgroundColor = .SSGray2
            sellButton.setTitle(title: "구매완료")

            // 테스트를 위해 지우기
            UserDefaults.standard.removeObject(forKey: "purchase")
        } else {
            lockContentView.isHidden = false
            storyContentScrollView.isScrollEnabled = false
        }
    }
    
    func setUpBottomView() {
        let bottomView = UIView()
        bottomView.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: bottomViewHeight)
        bottomView.backgroundColor = .white
        self.view.addSubview(bottomView)
        bottomView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(57 + bottomPadding)
        }
        
        let topSeparator = UIView()
        topSeparator.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 1)
        topSeparator.backgroundColor = .SSGray1
        bottomView.addSubview(topSeparator)
        topSeparator.snp.makeConstraints { make in
            make.top.equalTo(bottomView.snp.top)
            make.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
    
        sellButton.setAttributedTitle(.attributeFontStyle(font: .SSBold, size: 15, text: "200포인트로 구매하기", lineHeight: 24), for: .normal)
        sellButton.setTitleColor(.white, for: .normal)
        bottomView.addSubview(sellButton)
        sellButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(9)
            make.width.equalTo(256.adjustWidth)
        }
        sellButton.addTarget(self, action: #selector(selectSellButton), for: .touchUpInside)
        
        let commentButton = UIButton()
        commentButton.setImage(UIImage(named: "comment_ic"), for: .normal)
        bottomView.addSubview(commentButton)
        commentButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(13)
            make.left.equalTo(sellButton.snp.right).inset(-15)
        }
        
        let favoriteButton = UIButton()
        favoriteButton.setImage(UIImage(named: "favorite_white_ic"), for: .normal)
        bottomView.addSubview(favoriteButton)
        favoriteButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(13)
            make.left.equalTo(commentButton.snp.right).inset(-15)
        }
    }
    
    func setUpView() {
        storyContentScrollView.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - bottomViewHeight)
        storyContentScrollView.contentSize = .init(width: storyContentScrollView.frame.width, height: storyContentScrollView.frame.height)
        self.view.addSubview(storyContentScrollView)
        
        let categoryBadgeView = CategoryBadgeView(type: .lifeStyle)
        storyContentScrollView.addSubview(categoryBadgeView)
        categoryBadgeView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(14)
            make.left.equalToSuperview().inset(25)
        }
        
        let storyTitle = UILabel()
        storyTitle.numberOfLines = 2
        storyTitle.attributedText = .attributeFontStyle(font: .SSBold, size: 18, text: "힘들 때 이겨낼 수 있었던 저만의 경험을 소개해드립니다!", lineHeight: 24)
        storyTitle.textColor = .black
        storyContentScrollView.addSubview(storyTitle)
        storyTitle.snp.makeConstraints { make in
            make.top.equalTo(categoryBadgeView.snp.bottom).inset(-16)
            make.left.right.equalTo(self.view).inset(25)
        }
        
        let appealContent = UILabel()
        appealContent.numberOfLines = 0
        appealContent.attributedText = .attributeFontStyle(font: .SSRegular, size: 15, text: "여러분은 가장 힘들 때 어떤 일을 하시나요? 사람마다 많고 많은 경험들이 있을 것이라 생각됩니다! 그럼 그 중에서도 저, 일상의다이빙의 경험을 들어보실래요?", lineHeight: 22)
        appealContent.textColor = .black
        storyContentScrollView.addSubview(appealContent)
        appealContent.snp.makeConstraints { make in
            make.top.equalTo(storyTitle.snp.bottom).inset(-12)
            make.left.right.equalTo(self.view).inset(25)
        }
        
        let personIconImageView = UIImageView()
        personIconImageView.image = UIImage(named: "person_ic")
        storyContentScrollView.addSubview(personIconImageView)
        
        let personLabel = UILabel()
        personLabel.attributedText = .attributeFontStyle(font: .SSSemiBold, size: 13, text: "일상의다이빙", lineHeight: 24)
        storyContentScrollView.addSubview(personLabel)
        personLabel.snp.makeConstraints { make in
            make.right.equalTo(self.view).inset(25)
            make.top.equalTo(personIconImageView.snp.top)
        }
        
        personIconImageView.snp.makeConstraints { make in
            make.width.height.equalTo(15.adjustWidth)
            make.right.equalTo(personLabel.snp.left).inset(-5)
            make.top.equalTo(storyTitle.snp.bottom).inset(-114.adjustWidth)
        }
        
        separatorView.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 1)
        separatorView.backgroundColor = .SSGray1
        storyContentScrollView.addSubview(separatorView)
        separatorView.snp.makeConstraints { make in
            make.left.right.equalTo(self.view)
            make.height.equalTo(1)
            make.top.equalTo(personIconImageView.snp.bottom).inset(-20)
        }
        
        let storyContentLabel = UILabel()
        storyContentLabel.numberOfLines = 0
        storyContentLabel.attributedText = .attributeFontStyle(font: .SSRegular, size: 15, text: "여러분은 가장 힘들 때 어떤 일을 하시나요? 사람마다 많고 많은 경험들이 있을 것이라 생각됩니다! 그럼 그 중에서도 저, 일상의다이빙의 경험을 들어보실래요? 여러분은 가장 힘들 때 어떤 일을 하시나요? 사람마다 많고 많은 경험들이 있을 것이라 생각됩니다! 그럼 그 중에서도 저, 일상의다이빙의 경험을 들어보실래요? 여러분은 가장 힘들 때 어떤 일을 하시나요? 사람마다 많고 많은 경험들이 있을 것이라 생각됩니다! 그럼 그 중에서도 저, 일상의다이빙의 경험을 들어보실래요? 여러분은 가장 힘들 때 어떤 일을 하시나요 사람마다 많고 많은 경험들이 있을 것이라 생각됩니다! 그럼 그 중에서도 저, 일상의다이빙의 여러분은 가장 힘들 때 어떤 일을 하시나요? 사람마다 많고 많은 경험들이 있을 것이라 생각됩니다! 그럼 그 중에서도 저, 일상의다이빙의 경험을 들어보실래요? 여러분은 가장 힘들 때 어떤 일을 하시나요? 사람마다 많고 많은 경험들이 있을 것이라 생각됩니다! 그럼 그 중에서도 저, 일상의다이빙의 경험을 들어보실래요? 여러분은 가장 힘들 때 어떤 일을 하시나요? 사람마다 많고 많은 경험들이 있을 것이라 생각됩니다! 그럼 그 중에서도 저, 일상의다이빙의 경험을 들어보실래요? 여러분은 가장 힘들 때 어떤 일을 하시나요 사람마다 많고 많은 경험들이 있을 것이라 생각됩니다! 그럼 그 중에서도 저, 일상의다이빙의", lineHeight: 22)
        storyContentScrollView.addSubview(storyContentLabel)
        storyContentLabel.snp.makeConstraints { make in
            make.top.equalTo(separatorView.snp.bottom).inset(-15)
            make.left.right.equalTo(self.view).inset(25)
            make.bottom.equalToSuperview().inset(50)
        }
        
        lockContentView.isHidden = true
        self.view.addSubview(lockContentView)
        lockContentView.snp.makeConstraints { make in
            make.top.equalTo(separatorView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(386.adjustWidth)
        }
    }
}
