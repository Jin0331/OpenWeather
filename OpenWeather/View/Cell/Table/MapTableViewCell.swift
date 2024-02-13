//
//  MapTableViewCell.swift
//  OpenWeather
//
//  Created by JinwooLee on 2/13/24.
//

import UIKit
import MapKit
import SnapKit
import Then

class MapTableViewCell: BaseTableViewCell {
    
    let bgView = UIView().then {
        $0.backgroundColor = .black
        $0.layer.borderColor = UIColor.systemGray.cgColor
        $0.layer.borderWidth = 1
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    
    let titleLabel = CommonLabel().then {
        $0.text = "📍 위치"
        $0.font = .systemFont(ofSize: 18)
        $0.textColor = .systemGray
    }
    
    let mapView = MKMapView().then { _ in
    }
    
    override func configureHierarchy() {
        contentView.addSubview(bgView)
        
        bgView.addSubview(titleLabel)
        bgView.addSubview(mapView)
    }
    
    override func configureLayout() {
        bgView.snp.makeConstraints { make in
            make.edges.equalTo(contentView.safeAreaLayoutGuide)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview().inset(15)
            make.height.equalTo(20)
        }
        
        mapView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(bgView).inset(15)
            make.bottom.equalTo(bgView.snp.bottom).inset(15)
        }
    }
    
    func receiveData(data : CurrentModel?) {
        
        guard let data = data else {return}
        
        let center = CLLocationCoordinate2D(latitude: data.coord.lat,
                                            longitude: data.coord.lon)

        let region = MKCoordinateRegion(center: center,
                                        latitudinalMeters: 300000,
                                        longitudinalMeters: 300000)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        annotation.title = data.name
        annotation.subtitle = "현재 체감 온도 : \(data.main.tempConvert)°"
        
        
        mapView.setRegion(region, animated: false)
        mapView.addAnnotation(annotation)
    }
}
