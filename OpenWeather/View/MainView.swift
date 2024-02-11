//
//  MainView.swift
//  OpenWeather
//
//  Created by JinwooLee on 2/11/24.
//

import UIKit
import SnapKit
import Then

final class MainView: BaseView {

    let cityNameLabel = CommonLabel().then {
        $0.font = .systemFont(ofSize: 20, weight: .heavy)
        $0.text = "hi"
    }
    

    override func configureHierarchy() {
        addSubview(cityNameLabel)
    }
    
    override func configureLayout() {
        cityNameLabel.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(10)
        }
    }
    
}
