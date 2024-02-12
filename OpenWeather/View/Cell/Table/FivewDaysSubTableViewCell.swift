//
//  FivewDaysSubTableViewCell.swift
//  OpenWeather
//
//  Created by JinwooLee on 2/13/24.
//

import UIKit
import SnapKit
import Then

class FivewDaysSubTableViewCell: BaseTableViewCell {

    let bgView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    let dayNameLabel = CommonLabel().then {
        $0.text = "Today"
        $0.font = .systemFont(ofSize: 20)
    }
    
    let middleIconImage = UIImageView().then {
        $0.image = UIImage(systemName: "star.fill")
        $0.contentMode = .scaleAspectFill
        $0.tintColor = .white
    }
    
    let minTempLabel = CommonLabel().then {
        $0.text = "최저 2도"
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = .systemGray
    }
    
    let maxTempLabel = CommonLabel().then {
        $0.text = "최고 9도"
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = .systemGray
    }
    
    override func configureHierarchy() {
        contentView.addSubview(bgView)
        
        [dayNameLabel, middleIconImage, minTempLabel, maxTempLabel].forEach{ return bgView.addSubview($0)}
    }

    override func configureLayout() {
        bgView.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.top.horizontalEdges.equalTo(contentView.safeAreaLayoutGuide)
        }
        
        dayNameLabel.snp.makeConstraints { make in
            make.leading.verticalEdges.equalTo(bgView)
            make.width.equalTo(bgView).multipliedBy(0.25)
        }
        
        middleIconImage.snp.makeConstraints { make in
            make.leading.equalTo(dayNameLabel.snp.trailing).offset(5)
            make.top.equalTo(dayNameLabel)
            make.width.height.equalTo(bgView).multipliedBy(0.25)
        }
        
        minTempLabel.snp.makeConstraints { make in
            make.leading.verticalEdges.equalTo(middleIconImage)
            make.width.equalTo(bgView).multipliedBy(0.25)
        }
        
        minTempLabel.snp.makeConstraints { make in
            make.leading.verticalEdges.equalTo(minTempLabel)
            make.width.equalTo(bgView).multipliedBy(0.25)
        }
        
    }
    
}
