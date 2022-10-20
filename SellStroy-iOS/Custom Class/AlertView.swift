//
//  AlertView.swift
//  SellStroy-iOS
//
//  Created by minimani on 2022/10/20.
//

import UIKit

class AlertView: UIView {
    
    var okString: String = ""
    var cancleString: String?
    var okHandler: (() -> ())?
    var cancleHandler: (() -> ())?
    var title: String = ""
    var subTitle: String = ""
    
    override init(frame: CGRect) {
        super.init(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String, subTitle: String, okString: String, okHandler: (() -> ())?, cancleString: String?, cancleHandler: (() -> ())?) {
        self.init(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        
        self.title = title
        self.subTitle = subTitle
        self.okString = okString
        self.okHandler = okHandler
        self.cancleHandler = cancleHandler
        self.cancleString = cancleString
        
        setUpView()
    }
    
    @objc func selectCancelButton() {
        guard let cancleHandler = cancleHandler else { return }
        cancleHandler()
    }
    
    @objc func selectOkButton() {
        guard let okHandler = okHandler else { return }
        okHandler()
    }
    
    func showAlert() {
        Singleton.shared.changeStatusBarColor(backgroundColor: .clear)
        self.isHidden = false
    }
    
    func closeAlert() {
//        Singleton.shared.changeStatusBarColor(backgroundColor: .white)
        self.isHidden = true
    }
    
    private func setUpView() {
        self.isHidden = true
        
        let dimmedView = UIView()
        dimmedView.backgroundColor = .black.withAlphaComponent(0.4)
        self.addSubview(dimmedView)
        dimmedView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let alertView = UIView()
        alertView.frame = .init(x: 0, y: 0, width: 236, height: 182)
        alertView.layer.cornerRadius = 5
        alertView.backgroundColor = .white
        self.addSubview(alertView)
        alertView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.left.right.equalToSuperview().inset(25)
            make.height.equalTo(182)
        }
        
        let title = UILabel()
        title.attributedText = .attributeFontStyle(font: .SSSemiBold, size: 15, text: self.title, lineHeight: 26)
        title.textAlignment = .center
        alertView.addSubview(title)
        title.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().inset(47)
        }
        
        let subTitle = UILabel()
        subTitle.attributedText = .attributeFontStyle(font: .SSRegular, size: 13, text: self.subTitle, lineHeight: 26)
        subTitle.textAlignment = .center
        alertView.addSubview(subTitle)
        subTitle.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).inset(-5)
            make.left.right.equalToSuperview()
        }
        
        let buttonWidth = (UIScreen.main.bounds.width - 50) / 2
        
        
        let okButton = MainButton()
        okButton.frame = .init(x: 0, y: 0, width: buttonWidth, height: 53)
        okButton.setTitle(title: self.okString)
        okButton.layer.cornerRadius = 5
        alertView.addSubview(okButton)
        
        okButton.addTarget(self, action: #selector(selectOkButton), for: .touchUpInside)

        
        if cancleHandler != nil {
            let cancelButton = MainButton()
            cancelButton.frame = .init(x: 0, y: 0, width: buttonWidth, height: 53)
            cancelButton.setTitle(title: self.cancleString ?? "")
            cancelButton.backgroundColor = .SSGray2
            cancelButton.layer.cornerRadius = 5
            cancelButton.layer.maskedCorners = [.layerMinXMaxYCorner]
            alertView.addSubview(cancelButton)
            cancelButton.snp.remakeConstraints { make in
                make.bottom.left.equalToSuperview()
                make.width.equalTo(buttonWidth)
                make.height.equalTo(53)
            }
            cancelButton.addTarget(self, action: #selector(selectCancelButton), for: .touchUpInside)

            okButton.layer.maskedCorners = [.layerMaxXMaxYCorner]
            okButton.snp.remakeConstraints { make in
                make.bottom.right.equalToSuperview()
                make.width.equalTo(buttonWidth)
                make.height.equalTo(53)
            }
          
        } else {
            okButton.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            okButton.snp.remakeConstraints { make in
                make.bottom.right.left.equalToSuperview()
                make.height.equalTo(53)
            }
        }
        
      
        
    }
}
 
