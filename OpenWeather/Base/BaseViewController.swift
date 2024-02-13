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
        configureNavigation ()
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
        
        navigationItem.title = ""
        
        // back button
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil) // title 부분 수정
        backBarButtonItem.tintColor = .white
        self.navigationItem.backBarButtonItem = backBarButtonItem
        
        
    }
    
}


extension BaseViewController {
    //MARK: - 화면전환관련
        enum TransitionStyle {
            case present
            case presentNavigation // 네비게이션 임베드한 채로 present
            case presentFullNavigation // 네비게이션 임베드 된 full presesnt
            case push
        }

        func ViewTransition<T:BaseViewController>(style : TransitionStyle, viewControllerType : T.Type) {
            let vc = T()
            switch style {
            case .present:
                present(vc, animated: true)
            case .presentNavigation:
                let nav = UINavigationController(rootViewController: vc)
                present(nav, animated: true)
            case .presentFullNavigation:
                let nav = UINavigationController(rootViewController: vc)
                nav.modalPresentationStyle = .fullScreen
                present(nav, animated: true)
            case .push:
                navigationController?.pushViewController(vc, animated: true)
            }
        }
}
