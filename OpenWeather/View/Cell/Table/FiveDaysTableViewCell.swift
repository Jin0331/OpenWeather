//
//  FiveDaysTableViewCell.swift
//  OpenWeather
//
//  Created by JinwooLee on 2/13/24.
//

import UIKit
import SnapKit
import Then

class FiveDaysTableViewCell: BaseTableViewCell {

    let bgView = UIView().then {
        $0.backgroundColor = .black
        $0.layer.borderColor = UIColor.systemGray.cgColor
        $0.layer.borderWidth = 1
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    
    let titleLabel = CommonLabel().then {
        $0.text = "🗓️ 5일 간의 일기예보"
        $0.font = .systemFont(ofSize: 18)
        $0.textColor = .systemGray
    }
    
    let tempTableView = UITableView().then {
        $0.register(FivewDaysSubTableViewCell.self, forCellReuseIdentifier: FivewDaysSubTableViewCell.identifier)
    }
    
    override func configureHierarchy() {
        contentView.addSubview(bgView)
        
        [titleLabel, tempTableView].forEach{ return bgView.addSubview($0)}
    }
    
    override func configureLayout() {
        bgView.snp.makeConstraints { make in
            make.edges.equalTo(contentView.safeAreaLayoutGuide)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview().inset(15)
            make.height.equalTo(20)
        }
        
        tempTableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.bottom.horizontalEdges.equalToSuperview()
        }
    }
}
