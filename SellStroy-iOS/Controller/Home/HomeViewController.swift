//
//  HomeViewController.swift
//  SellStroy-iOS
//
//  Created by minimani on 2022/10/02.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let leftTabItem = UIBarButtonItem(image: UIImage(named: "logo_white")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
        self.navigationItem.setLeftBarButton(leftTabItem, animated: true)
        
        setUpView()
    }
    
    func setUpView() {
        let topMaskView = UIView()
        topMaskView.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 226)
        topMaskView.backgroundColor = .SSRed
        self.view.addSubview(topMaskView)
        topMaskView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(226)
        }
        
        let homeTableView = UITableView()
        homeTableView.delegate = self
        homeTableView.dataSource = self
        self.view.addSubview(homeTableView)
        homeTableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = ""
        
        if let reuseCell = tableView.dequeueReusableCell(withIdentifier: identifier) {
            return reuseCell
        }
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
        cell.textLabel?.text = "a"
        
        return cell
    }
    
    
}
