//
//  HomeViewController.swift
//  SellStroy-iOS
//
//  Created by minimani on 2022/10/02.
//

import UIKit

class HomeViewController: UIViewController {
    
    let maskViewHeight = 45.adjustHeight

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        // 기본 로고 화이트 세팅
        setLogoWhite()
        setUpView()
    }
    
    func setUpView() {
        
        let topMaskView = UIView()
        topMaskView.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 226)
        topMaskView.backgroundColor = .SSRed
        self.view.addSubview(topMaskView)
        topMaskView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalTo(self.view)
            make.height.equalTo(226)
        }
        
        let homeTitleLabel = UILabel()
        homeTitleLabel.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 83)
        homeTitleLabel.numberOfLines = 2
        homeTitleLabel.attributedText = .attributeFontStyle(font: .SSMedium, size: 20, text: "오늘도 좋은 하루 보내세요,\n소소한일상님!", lineHeight: 30)
        homeTitleLabel.textColor = .white
     
        let homeTableView = UITableView()
        homeTableView.backgroundColor = .clear
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.tableHeaderView = homeTitleLabel
        homeTableView.bounces = false
        homeTableView.estimatedRowHeight = 186
        homeTableView.rowHeight = UITableView.automaticDimension
        homeTableView.separatorStyle = .none
        self.view.addSubview(homeTableView)
        homeTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        homeTitleLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.right.equalToSuperview().inset(21)
            make.height.equalTo(83.adjustHeight)
        }
        
        let floatingButton = UIButton()
        floatingButton.frame = .init(x: 0, y: 0, width: 36.adjustWidth, height: 106.adjustWidth)
        floatingButton.clipsToBounds = true
        floatingButton.layer.cornerRadius = 18
        floatingButton.backgroundColor = .SSRed
        floatingButton.setImage(UIImage(named: "pencli_ic"), for: .normal)
        floatingButton.setAttributedTitle(.attributeFontStyle(font: .SSSemiBold, size: 14, text: "경험쓰기", lineHeight: 20), for: .normal)
        floatingButton.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 8)
        floatingButton.setTitleColor(.white, for: .normal)
        self.view.addSubview(floatingButton)
        floatingButton.snp.makeConstraints { make in
            make.height.equalTo(36.adjustWidth)
            make.width.equalTo(106.adjustWidth)
            make.right.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().inset(15)
        }
    }
    
    /// 로고 화이트 세팅
    func setLogoWhite() {
        let leftTabItem = UIBarButtonItem(image: UIImage(named: "logo_white")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
        self.navigationController?.navigationBar.backgroundColor = .SSRed
        self.navigationItem.setLeftBarButton(leftTabItem, animated: true)
        Singleton.shared.changeStatusBarColor(backgroundColor: .SSRed)
    }
    
    /// 로고 블랙 세팅
    func setLogoBlack() {
        let leftTabItem = UIBarButtonItem(image: UIImage(named: "logo")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationItem.setLeftBarButton(leftTabItem, animated: true)
        Singleton.shared.changeStatusBarColor(backgroundColor: .white)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "\(indexPath.row)"
        
        if let reuseCell = tableView.dequeueReusableCell(withIdentifier: identifier) {
            return reuseCell
        }
        
        let cell = ExperienceTableViewCell.init(style: .default, reuseIdentifier: identifier)
        cell.backgroundColor = .SSGray1
        cell.selectionStyle = .none
        
        if indexPath.row == 0 {
            let maskView = UIView()
            maskView.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: maskViewHeight)
            maskView.backgroundColor = .SSRed
            cell.contentView.addSubview(maskView)
            maskView.snp.makeConstraints { make in
                make.top.left.right.equalToSuperview()
                make.height.equalTo(maskViewHeight)
            }
            cell.contentView.sendSubviewToBack(maskView)
        }
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > maskViewHeight {
           setLogoBlack()
        } else {
            setLogoWhite()
        }
    }
    
}
