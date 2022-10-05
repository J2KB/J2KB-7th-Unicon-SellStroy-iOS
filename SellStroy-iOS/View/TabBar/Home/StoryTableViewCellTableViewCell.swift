//
//  ExperienceTableViewCell.swift
//  SellStroy-iOS
//
//  Created by minimani on 2022/10/05.
//

import UIKit

class StoryTableViewCell: UITableViewCell {
    
    let cellView = UIView()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        cellView.frame = .init(x: 0, y: 0, width: 345.adjustWidth, height: 179.adjustHeight)
        cellView.clipsToBounds = true
        cellView.layer.cornerRadius = 5
        cellView.backgroundColor = .white
        self.contentView.addSubview(cellView)
        
        let categoryBadgeView = CategoryBadgeView(type: .lifeStyle)
        cellView.addSubview(categoryBadgeView)
        categoryBadgeView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(14)
            make.left.equalToSuperview().inset(13)
        }
        
        let storyTitle = UILabel()
        storyTitle.numberOfLines = 2
        storyTitle.attributedText = .attributeFontStyle(font: .SSBold, size: 15, text: "힘들 때 이겨낼 수 있었던 저만의 경험을 소개해드립니다!", lineHeight: 21)
        storyTitle.textColor = .black
        cellView.addSubview(storyTitle)
        storyTitle.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(13)
            make.top.equalTo(categoryBadgeView.snp.bottom).inset(-12)
        }
        
        let appealContent = UILabel()
        appealContent.numberOfLines = 2
        appealContent.attributedText = .attributeFontStyle(font: .SSRegular, size: 12, text: "여러분은 가장 힘들 때 어떤 일을 하시나요? 사람마다 많고 많은 경험들이 있을 것이라 생각됩니다!", lineHeight: 20)
        appealContent.textColor = .black
        cellView.addSubview(appealContent)
        appealContent.snp.makeConstraints { make in
            make.top.equalTo(storyTitle.snp.bottom).inset(-6)
            make.left.right.equalToSuperview().inset(13)
        }
        
        let pointIconImageView = UIImageView()
        pointIconImageView.image = UIImage(named: "point_ic")
        cellView.addSubview(pointIconImageView)
        pointIconImageView.snp.makeConstraints { make in
            make.width.equalTo(18.adjustWidth)
            make.height.equalTo(20.adjustWidth)
            make.left.equalToSuperview().inset(13)
            make.top.equalTo(storyTitle.snp.bottom).inset(-54)
        }
        
        let pointLabel = UILabel()
        pointLabel.attributedText = .attributeFontStyle(font: .SSSemiBold, size: 10, text: "200", lineHeight: 10)
        cellView.addSubview(pointLabel)
        pointLabel.snp.makeConstraints { make in
            make.left.equalTo(pointIconImageView.snp.right).inset(-5)
            make.top.equalTo(pointIconImageView.snp.top).inset(5)
        }
        
        let favoriteIconImageView = UIImageView()
        favoriteIconImageView.image = UIImage(named: "favorite_ic")
        cellView.addSubview(favoriteIconImageView)
        favoriteIconImageView.snp.makeConstraints { make in
            make.width.height.equalTo(15.adjustWidth)
            make.left.equalTo(pointLabel.snp.right).inset(-10)
            make.top.equalTo(storyTitle.snp.bottom).inset(-56)
        }
        
        let favoriteLabel = UILabel()
        favoriteLabel.attributedText = .attributeFontStyle(font: .SSSemiBold, size: 10, text: "20", lineHeight: 10)
        cellView.addSubview(favoriteLabel)
        favoriteLabel.snp.makeConstraints { make in
            make.left.equalTo(favoriteIconImageView.snp.right).inset(-5)
            make.top.equalTo(favoriteIconImageView.snp.top).inset(3)
        }
        
        let personIconImageView = UIImageView()
        personIconImageView.image = UIImage(named: "person_ic")
        cellView.addSubview(personIconImageView)
        
        
        let personLabel = UILabel()
        personLabel.attributedText = .attributeFontStyle(font: .SSSemiBold, size: 10, text: "일상의다이빙", lineHeight: 10)
        cellView.addSubview(personLabel)
        personLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(15)
            make.top.equalTo(personIconImageView.snp.top).inset(3)
        }
        
        personIconImageView.snp.makeConstraints { make in
            make.width.height.equalTo(15.adjustWidth)
            make.right.equalTo(personLabel.snp.left).inset(-5)
            make.top.equalTo(favoriteIconImageView.snp.top)
        }
        
        cellView.snp.makeConstraints { make in
            make.top.equalTo(categoryBadgeView.snp.top).inset(-14)
            make.bottom.equalTo(appealContent.snp.bottom).inset(-45)
            make.left.right.equalToSuperview().inset(15)
            make.top.bottom.equalToSuperview().inset(7.5)

        }
    }
}
