//
//  BaseViewController.swift
//  OpenWeather
//
//  Created by JinwooLee on 2/11/24.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureView() 
    }

    func configureHierarchy() {
        
    }
    
    func configureLayout() {
        
    }
    
    func configureView() {
    }
    
    func configureNavigation () {
        // background color
        navigationController?.navigationBar.scrollEdgeAppearance?.backgroundColor = .black
        navigationController?.navigationBar.barTintColor = UIColor.black
        
        // font setting
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 25, weight: .heavy)
        ]
        
        // back button
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil) // title 부분 수정
        backBarButtonItem.tintColor = .white
        self.navigationItem.backBarButtonItem = backBarButtonItem
        
        // profile button
        let profileButton = UIBarButtonItem(image: UIImage(systemName: "figure.child.circle"), style: .plain, target: self, action: #selector(profileButtonClicked))
        profileButton.tintColor = .white
        
        //  item 설정
        navigationItem.rightBarButtonItem = profileButton
        navigationItem.title = ""
        
    }
    
    // profile button 누를때 동작
    @objc func profileButtonClicked(_ sender : UIBarButtonItem) {
    }
}
