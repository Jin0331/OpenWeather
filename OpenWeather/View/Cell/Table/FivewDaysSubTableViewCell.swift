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
        $0.font = .systemFont(ofSize: 25)
    }
    
    let middleIconImage = UIImageView().then {
        $0.contentMode = .scaleToFill
    }
    
    let minTempLabel = CommonLabel().then {
        $0.font = .systemFont(ofSize: 22)
        $0.textColor = .systemGray
    }
    
    let maxTempLabel = CommonLabel().then {
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
            make.width.equalTo(bgView).multipliedBy(0.2)
        }
        
        middleIconImage.snp.makeConstraints { make in
            make.leading.equalTo(dayNameLabel.snp.trailing)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(50)
            
        }
        
        minTempLabel.snp.makeConstraints { make in
            make.leading.equalTo(middleIconImage.snp.trailing).offset(20)
            make.verticalEdges.equalTo(bgView)
            make.width.equalTo(bgView).multipliedBy(0.25)
        }
        
        maxTempLabel.snp.makeConstraints { make in
            make.leading.equalTo(minTempLabel.snp.trailing).offset(15)
            make.verticalEdges.equalTo(bgView)
            make.width.equalTo(bgView).multipliedBy(0.25)
        }
        
    }
    
    func receiveData(data : CurrentModel?) {
        
        guard let data = data else { return }
        
        dayNameLabel.text = "Today"
        let url = URL(string: "\(OpenWeatherAPI.iconUrl)\(data.weather[0].icon)@2x.png")!
        middleIconImage.kf.setImage(with: url, options: [.transition(.fade(1))])
        minTempLabel.text = "최저 \(data.main.tempMinConvert)°"
        maxTempLabel.text = "최고 \(data.main.tempMaxConvert)°"
    }
    
    func receiveData(data : [String]?) {
        
        guard let data = data else { return }
        
        dayNameLabel.text = "\(data[1])"
        let url = URL(string: "\(OpenWeatherAPI.iconUrl)\(data[4])@2x.png")!
        middleIconImage.kf.setImage(with: url, options: [.transition(.fade(1))])
        minTempLabel.text = "최저 \(data[2])°"
        maxTempLabel.text = "최고 \(data[3])°"

    }
}
