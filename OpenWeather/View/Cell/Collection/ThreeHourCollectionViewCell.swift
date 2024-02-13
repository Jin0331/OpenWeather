//
//  ThreeHourCollectionViewCell.swift
//  OpenWeather
//
//  Created by JinwooLee on 2/12/24.
//

import UIKit
import SnapKit
import Then
import Kingfisher

class ThreeHourCollectionViewCell: BaseCollectionViewCell {
    
    let topLabel = CommonLabel().then {
        $0.font = .systemFont(ofSize: 20, weight: .heavy)
        $0.textAlignment = .center
        $0.textColor = .systemGray
    }
    
    let middleIconImage = UIImageView().then {
        $0.contentMode = .scaleToFill
        $0.tintColor = .white
    }
    
    let bottomLabel = CommonLabel().then {
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
            make.top.equalTo(topLabel.snp.bottom).offset(15)
//            make.horizontalEdges.equalTo(topLabel).inset(25)
            make.centerX.equalTo(topLabel)
            make.height.width.equalTo(50)
        }
        
        bottomLabel.snp.makeConstraints { make in
            make.top.equalTo(middleIconImage.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(topLabel)
            make.bottom.equalTo(contentView.snp.bottom).inset(5)
        }
    }
    
    func receiveData(data : [Any]?) {
        
        guard let data = data else { return }
        
        print("\(data[3])")
        
        topLabel.text = "\(data[1])시"
        let url = URL(string: "\(OpenWeatherAPI.iconUrl)\(data[3])@2x.png")!
        middleIconImage.kf.setImage(with: url, options: [.transition(.fade(1))])
        bottomLabel.text = "\(data[2])°"
        
        
    }
    
}
