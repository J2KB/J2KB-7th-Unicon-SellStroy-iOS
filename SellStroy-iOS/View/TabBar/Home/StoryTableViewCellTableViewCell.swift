//
//  ExperienceTableViewCell.swift
//  SellStroy-iOS
//
//  Created by minimani on 2022/10/05.
//

import UIKit

class StoryTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        let singelStroyView = SingelStoryView()
        self.contentView.addSubview(singelStroyView)
        singelStroyView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
