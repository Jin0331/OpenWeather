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
        $0.font = .systemFont(ofSize: 45, weight: .heavy)
        $0.text = ""
    }
    
    let tempLabel = CommonLabel().then {
        $0.font = .systemFont(ofSize: 100)
        $0.text = ""
    }
    
    let descLabel = CommonLabel().then {
        $0.font = .systemFont(ofSize: 25)
        $0.text = ""
    }
    
    let maxMinLabel = CommonLabel().then {
        $0.font = .systemFont(ofSize: 25)
        $0.text = ""
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
    
    func receiveData(data : CurrentModel?) {
        
        guard let data = data else { return }
        
        cityLabel.text = data.name
        tempLabel.text = data.main.tempConvert + "°"
        descLabel.text = data.weather[0].mainDescription
        maxMinLabel.text = "체감온도 : \(data.main.feelsLikeConvert)°"
    }
    
}
