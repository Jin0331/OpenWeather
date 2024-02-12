//
//  ThreeHourCollectionViewCell.swift
//  OpenWeather
//
//  Created by JinwooLee on 2/12/24.
//

import UIKit
import SnapKit
import Then

class ThreeHourCollectionViewCell: BaseCollectionViewCell {
    
    let topLabel = CommonLabel().then {
        $0.text = "12시"
        $0.font = .systemFont(ofSize: 20, weight: .heavy)
        $0.textAlignment = .center
        $0.textColor = .systemGray
    }
    
    let middleIconImage = UIImageView().then {
        $0.image = UIImage(systemName: "star.fill")
        $0.contentMode = .scaleAspectFill
        $0.tintColor = .white
    }
    
    let bottomLabel = CommonLabel().then {
        $0.text = "7도"
        $0.font = .systemFont(ofSize: 22, weight: .heavy)
        $0.textAlignment = .center
        $0.textColor = .systemGray
    }
    
    override func configureHierarchy() {
        [topLabel, middleIconImage, bottomLabel].forEach { return contentView.addSubview($0)}
    }
    
    override func configureLayout() {
        topLabel.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(contentView.safeAreaLayoutGuide)
            make.height.equalTo(30)
        }
        
        middleIconImage.snp.makeConstraints { make in
            make.top.equalTo(topLabel.snp.bottom).offset(25)
            make.horizontalEdges.equalTo(topLabel).inset(25)
        }
        
        bottomLabel.snp.makeConstraints { make in
            make.top.equalTo(middleIconImage.snp.bottom).offset(25)
            make.horizontalEdges.equalTo(topLabel)
            make.bottom.equalTo(contentView.snp.bottom).inset(5)
        }
    }
    
    override func configureView() {
        backgroundColor = .purple
    }
    
}
