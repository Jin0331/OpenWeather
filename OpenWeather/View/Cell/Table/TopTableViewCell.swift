//
//  TopTableViewCell.swift
//  OpenWeather
//
//  Created by JinwooLee on 2/12/24.
//

import UIKit
import SnapKit
import Then

class TopTableViewCell: BaseTableViewCell{

    let cityLabel = CommonLabel().then {
        $0.font = .systemFont(ofSize: 40, weight: .heavy)
        $0.text = "Jeju City"
    }
    
    let tempLabel = CommonLabel().then {
        $0.font = .systemFont(ofSize: 100)
        $0.text = "5.9"
    }
    
    let descLabel = CommonLabel().then {
        $0.font = .systemFont(ofSize: 25)
        $0.text = "Broken Clouds"
    }
    
    let maxMinLabel = CommonLabel().then {
        $0.font = .systemFont(ofSize: 25)
        $0.text = "최고 : 7.0 | 최저 -4.2"
    }

    override func configureHierarchy() {
        [cityLabel, tempLabel, descLabel, maxMinLabel].forEach { item in
            return contentView.addSubview(item)
        }
    }
    
    override func configureLayout() {
        cityLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).inset(40)
            make.centerX.equalTo(contentView.safeAreaLayoutGuide)
        }
        
        tempLabel.snp.makeConstraints { make in
            make.top.equalTo(cityLabel.snp.bottom).offset(5)
            make.centerX.equalTo(contentView.safeAreaLayoutGuide)
        }
        
        descLabel.snp.makeConstraints { make in
            make.top.equalTo(tempLabel.snp.bottom).offset(5)
            make.centerX.equalTo(contentView.safeAreaLayoutGuide)
        }
        
        maxMinLabel.snp.makeConstraints { make in
            make.top.equalTo(descLabel.snp.bottom).offset(5)
            make.centerX.equalTo(contentView.safeAreaLayoutGuide)
            make.bottom.equalTo(contentView.snp.bottom).inset(40)
        }
    }
    
    override func configureView() {
        super.configureView()
        backgroundColor = .red
    }
    
}
