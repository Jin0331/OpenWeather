//
//  BottomTableViewCell.swift
//  OpenWeather
//
//  Created by JinwooLee on 2/13/24.
//

import UIKit
import SnapKit
import Then

class BottomTableViewCell: BaseTableViewCell {
    
    let topStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 10
        $0.distribution = .fillEqually
    }
    
    let topLeftView = UIView().then {
        $0.viewOption()
    }
    
    let topLeftLabel1 = CommonLabel().then {
        $0.textColor = .systemGray6
        $0.font = .systemFont(ofSize: 14)
        $0.text = "💨 바람 속도"
    }
    
    let topLeftLabel2 = CommonLabel().then {
        $0.font = .systemFont(ofSize: 40)
        $0.text = "1.35 MS"
    }
    
    let topLeftLabel3 = CommonLabel().then {
        $0.font = .systemFont(ofSize: 17)
        $0.text = "1.35 MS"
    }
    
    let topRightView = UIView().then {
        $0.viewOption()
    }
    
    let topRightLabel1 = CommonLabel().then {
        $0.textColor = .systemGray6
        $0.font = .systemFont(ofSize: 14)
        $0.text = "☁️ 구름"
    }
    
    let topRightLabel2 = CommonLabel().then {
        $0.font = .systemFont(ofSize: 40)
        $0.text = "1.35 MS"
    }
    
    let bottomStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 10
        $0.distribution = .fillEqually
    }
    
    let bottomLeftView = UIView().then {
        $0.viewOption()
    }
    
    let bottomLeftLabel1 = CommonLabel().then {
        $0.textColor = .systemGray6
        $0.font = .systemFont(ofSize: 14)
        $0.text = "🌬️ 기압"
    }
    
    let bottomLeftLabel2 = CommonLabel().then {
        $0.font = .systemFont(ofSize: 40)
        $0.text = "1.35 MS"
    }
    
    let bottomLeftLabel3 = CommonLabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.text = "hpa"
    }
    
    let bottomRightView = UIView().then {
        $0.viewOption()
    }
    
    let bottomRightLabel1 = CommonLabel().then {
        $0.textColor = .systemGray6
        $0.font = .systemFont(ofSize: 14)
        $0.text = "💦 습도"
    }
    
    let bottomRightLabel2 = CommonLabel().then {
        $0.font = .systemFont(ofSize: 40)
        $0.text = "1.35 MS"
    }
    
    override func configureHierarchy() {
        contentView.addSubview(topStackView)
        
        topStackView.addArrangedSubview(topLeftView)
        topLeftView.addSubview(topLeftLabel1)
        topLeftView.addSubview(topLeftLabel2)
        topLeftView.addSubview(topLeftLabel3)
    
        topStackView.addArrangedSubview(topRightView)
        topRightView.addSubview(topRightLabel1)
        topRightView.addSubview(topRightLabel2)
        
        contentView.addSubview(bottomStackView)
        
        bottomStackView.addArrangedSubview(bottomLeftView)
        bottomLeftView.addSubview(bottomLeftLabel1)
        bottomLeftView.addSubview(bottomLeftLabel2)
        bottomLeftView.addSubview(bottomLeftLabel3)
        
        bottomStackView.addArrangedSubview(bottomRightView)
        bottomRightView.addSubview(bottomRightLabel1)
        bottomRightView.addSubview(bottomRightLabel2)
    }
    
    override func configureLayout() {
        
        // top
        topStackView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.height.equalTo(contentView.snp.height).multipliedBy(0.5)
        }
        
        topLeftLabel1.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview().inset(20)
        }
        
        topLeftLabel2.snp.makeConstraints { make in
            make.top.equalTo(topLeftLabel1.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(topLeftLabel1)
        }
        
        topLeftLabel3.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(20)
            make.horizontalEdges.equalTo(topLeftLabel2)
        }
        
        topRightLabel1.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview().inset(20)
        }
        
        topRightLabel2.snp.makeConstraints { make in
            make.top.equalTo(topRightLabel1.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(topRightLabel1)
        }
        
        // bottom
        bottomLeftLabel1.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview().inset(20)
        }
        
        bottomLeftLabel2.snp.makeConstraints { make in
            make.top.equalTo(bottomLeftLabel1.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(bottomLeftLabel1)
        }
        
        bottomLeftLabel3.snp.makeConstraints { make in
            make.top.equalTo(bottomLeftLabel2.snp.bottom).offset(3)
            make.horizontalEdges.equalTo(topLeftLabel2)
        }
        
        bottomRightLabel1.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview().inset(20)
        }
        
        bottomRightLabel2.snp.makeConstraints { make in
            make.top.equalTo(bottomRightLabel1.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(bottomRightLabel1)
        }
        
        bottomStackView.snp.makeConstraints { make in
            make.top.equalTo(topStackView.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(contentView.snp.height).multipliedBy(0.5)
        }
    }
}
