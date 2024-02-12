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
        $0.backgroundColor = .blue
    }
    
    let dayNameLabel = CommonLabel().then {
        $0.text = "Today"
        $0.font = .systemFont(ofSize: 25)
    }
    
    let middleIconImage = UIImageView().then {
        $0.image = UIImage(systemName: "star.fill")
        $0.contentMode = .scaleAspectFill
        $0.tintColor = .white
    }
    
    let minTempLabel = CommonLabel().then {
        $0.text = "최저 2도"
        $0.font = .systemFont(ofSize: 22)
        $0.textColor = .systemGray
    }
    
    let maxTempLabel = CommonLabel().then {
        $0.text = "최고 9도"
        $0.font = .systemFont(ofSize: 22)
    }
    
    override func configureHierarchy() {
        contentView.addSubview(bgView)
        
        [dayNameLabel, middleIconImage, minTempLabel, maxTempLabel].forEach{ return bgView.addSubview($0)}
    }

    override func configureLayout() {
        bgView.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.horizontalEdges.equalTo(contentView.safeAreaLayoutGuide)
        }
        
        dayNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(bgView).offset(20)
            make.verticalEdges.equalTo(bgView)
            make.width.equalTo(bgView).multipliedBy(0.25)
        }
        
        middleIconImage.snp.makeConstraints { make in
            make.leading.equalTo(dayNameLabel.snp.trailing).offset(5)
            make.verticalEdges.equalTo(dayNameLabel).inset(5)

        }
        
        minTempLabel.snp.makeConstraints { make in
//            make.leading.verticalEdges.equalTo(middleIconImage)
            make.leading.equalTo(middleIconImage.snp.trailing).offset(25)
            make.verticalEdges.equalTo(bgView)
            make.width.equalTo(bgView).multipliedBy(0.25)
        }
        
        maxTempLabel.snp.makeConstraints { make in
            make.leading.equalTo(minTempLabel.snp.trailing).offset(15)
            make.verticalEdges.equalTo(bgView)
            make.width.equalTo(bgView).multipliedBy(0.25)
        }
        
    }
    
}
