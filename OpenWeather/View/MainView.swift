//
//  MainView.swift
//  OpenWeather
//
//  Created by JinwooLee on 2/11/24.
//

import UIKit
import SnapKit
import Then

final class MainView: BaseView {
    
    let mainTableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.estimatedRowHeight = 250
        $0.register(TopTableViewCell.self, forCellReuseIdentifier: TopTableViewCell.identifier)
        $0.register(ThreeHourTableViewCell.self, forCellReuseIdentifier: ThreeHourTableViewCell.identifier)
        $0.register(FiveDaysTableViewCell.self, forCellReuseIdentifier: FiveDaysTableViewCell.identifier)
        $0.register(MapTableViewCell.self, forCellReuseIdentifier: MapTableViewCell.identifier)
        $0.register(BottomTableViewCell.self, forCellReuseIdentifier: BottomTableViewCell.identifier)
    }
    
    override func configureHierarchy() {
        self.addSubview(mainTableView)
    }
    
    override func configureLayout() {
        mainTableView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
    }
    
}
