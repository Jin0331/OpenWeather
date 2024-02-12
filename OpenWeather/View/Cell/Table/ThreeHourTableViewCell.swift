//
//  ThreeHourTableViewCell.swift
//  OpenWeather
//
//  Created by JinwooLee on 2/12/24.
//

import UIKit
import SnapKit
import Then

class ThreeHourTableViewCell: BaseTableViewCell {

    let bgView = UIView().then {
        $0.backgroundColor = .black
        $0.layer.borderColor = UIColor.systemGray.cgColor
        $0.layer.borderWidth = 1
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    
    let titleLabel = CommonLabel().then {
        $0.text = "🗓️ 3시간 간격의40 일기예보"
        $0.font = .systemFont(ofSize: 18)
        $0.textColor = .systemGray
    }
    
    lazy var tempCollectionView = UICollectionView(frame: .zero, collectionViewLayout: configureCellLayout()).then {
        $0.register(ThreeHourCollectionViewCell.self, forCellWithReuseIdentifier: ThreeHourCollectionViewCell.identifier)
        $0.backgroundColor = .clear
    }
    
    override func configureHierarchy() {
        contentView.addSubview(bgView)
        
        bgView.addSubview(titleLabel)
        bgView.addSubview(tempCollectionView)
    }
    
    override func configureLayout() {
        bgView.snp.makeConstraints { make in
            make.edges.equalTo(contentView.safeAreaLayoutGuide)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview().inset(15)
            make.height.equalTo(20)
        }
        
        tempCollectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.bottom.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(10)
        }
    }
    
    override func configureView() {
        super.configureView()
        backgroundColor = .orange
    }
    
    private func configureCellLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 80, height: 150)
        layout.minimumLineSpacing = 0 // item간 간격
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        
        return layout
    }

}
