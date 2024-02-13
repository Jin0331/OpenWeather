//
//  SearchView.swift
//  OpenWeather
//
//  Created by JinwooLee on 2/13/24.
//

import UIKit
import SnapKit
import Then

final class SearchView : BaseView {
    
    let topLabel = CommonLabel().then {
        $0.font = .systemFont(ofSize: 25, weight: .heavy)
        $0.text = "City"
    }
    
    let searchBar = UISearchBar().then {
        $0.barStyle = .black
        $0.searchBarStyle = .minimal
    }
    
    let mainTableView = UITableView().then {
        $0.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        $0.backgroundColor = .black
        $0.rowHeight = 60
    }
    
    override func configureHierarchy() {
        [topLabel, searchBar, mainTableView].forEach { return addSubview($0) }
    }
    
    override func configureLayout() {
        topLabel.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(15)
        }
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(topLabel.snp.bottom).offset(10)
            make.leading.equalTo(topLabel)
            make.trailing.equalTo(safeAreaLayoutGuide).inset(15)
        }
        mainTableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(10)
            make.bottom.horizontalEdges.equalTo(safeAreaLayoutGuide)
        }
        
    }
    
}
