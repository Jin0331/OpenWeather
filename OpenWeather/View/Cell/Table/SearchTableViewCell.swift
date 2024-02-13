//
//  SearchTableViewCell.swift
//  OpenWeather
//
//  Created by JinwooLee on 2/14/24.
//

import UIKit
import SnapKit
import Then

class SearchTableViewCell: BaseTableViewCell {

    var id = 0
    
    let leftLabel = CommonLabel().then {
        $0.font = .systemFont(ofSize: 20, weight: .heavy)
        $0.text = "#"
    }
    
    let cityLabel = CommonLabel().then {
        $0.text = "SEOUL"
    }
    
    let nationLabel = CommonLabel().then {
        $0.font = .systemFont(ofSize: 13, weight: .semibold)
        $0.text = "KR"
    }
    
    override func configureHierarchy() {
        [leftLabel, cityLabel, nationLabel].forEach{ return contentView.addSubview($0) }
    }
    
    override func configureLayout() {
        leftLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(15)
            make.width.equalTo(20)
        }
        
        cityLabel.snp.makeConstraints { make in
            make.top.equalTo(leftLabel.snp.top)
            make.leading.equalTo(leftLabel.snp.trailing).offset(5)
            make.trailing.equalTo(contentView.safeAreaLayoutGuide)
        }
        
        nationLabel.snp.makeConstraints { make in
            make.top.equalTo(cityLabel.snp.bottom)
            make.horizontalEdges.equalTo(cityLabel)
        }
    }
    
    func receiveData(data : CityList) {
        cityLabel.text = data.name
        nationLabel.text = data.country
        id = data.id
    }
}
