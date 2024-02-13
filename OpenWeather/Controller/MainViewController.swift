//
//  ViewController.swift
//  OpenWeather
//
//  Created by JinwooLee on 2/11/24.
//

import UIKit
import MapKit

final class MainViewController: UIViewController {
    
    let mainView = MainView()
    
    var current : CurrentModel?
    var forecast : ForecastModel?
    
    let tempID = 1835847 // seoul,, 임시
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.mainTableView.delegate = self
        mainView.mainTableView.dataSource = self
        
        let group = DispatchGroup()
        
        group.enter()
        DispatchQueue.global().async(group:group) {
            OpenWeatherAPIManager.shared.fetch(api: .current(id: String(self.tempID))) { (item:CurrentModel) in
                self.current = item
                group.leave()
            }
        }
        
        group.enter()
        DispatchQueue.global().async(group:group) {
            OpenWeatherAPIManager.shared.fetch(api: .forecast(id: String(self.tempID))) { (item:ForecastModel) in
                self.forecast = item
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            print("조회 완료")
            self.mainView.mainTableView.reloadData()
        }
    }
}

extension MainViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if tableView == mainView.mainTableView {
            
            if indexPath.row == 0 {
                return UITableView.automaticDimension
            } else if indexPath.row == 1 || indexPath.row == 2 {
                return 200
            } else if indexPath.row == 3 {
                return 300
            } else {
                return 350
            }
        } else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableView == mainView.mainTableView ? 5 : 5
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //MARK: - Outer TableView
        if tableView == mainView.mainTableView {
            if indexPath.row  == 0 { //MARK: - TopTableView
                let cell = tableView.dequeueReusableCell(withIdentifier: TopTableViewCell.identifier, for: indexPath) as! TopTableViewCell
                
                cell.receiveData(data: current)
                
                return cell
            } else if indexPath.row == 1 { //MARK: - Three Hour
                let cell = tableView.dequeueReusableCell(withIdentifier: ThreeHourTableViewCell.identifier, for: indexPath) as! ThreeHourTableViewCell
                
                cell.tempCollectionView.delegate = self
                cell.tempCollectionView.dataSource = self
                cell.tempCollectionView.tag = 0
                cell.tempCollectionView.reloadData()
                
                return cell
            } else if indexPath.row == 2 { //MARK: - Five Days
                let cell = tableView.dequeueReusableCell(withIdentifier: FiveDaysTableViewCell.identifier, for: indexPath) as! FiveDaysTableViewCell
                
                cell.tempTableView.delegate = self
                cell.tempTableView.dataSource = self
                cell.tempTableView.reloadData()
                
                return cell
            } else if indexPath.row == 3 {
                let cell = tableView.dequeueReusableCell(withIdentifier: MapTableViewCell.identifier, for: indexPath) as! MapTableViewCell
                
                cell.mapView.delegate = self
                cell.receiveData(data: current)
                
                return cell
                
            } else if indexPath.row == 4 {
                let cell = tableView.dequeueReusableCell(withIdentifier: BottomTableViewCell.identifier, for: indexPath) as! BottomTableViewCell
                
                cell.receiveData(data: current)
                
                return cell
                
                
            } else {
                return UITableViewCell()
            }
            //MARK: - inner TableView
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: FivewDaysSubTableViewCell.identifier, for: indexPath) as! FivewDaysSubTableViewCell
            
            if indexPath.row == 0 {
                cell.receiveData(data: current)
            } else {
                cell.receiveData(data: forecast?.fiveDaysFromMinMax[indexPath.row - 1])
            }
            return cell
        }
    }
}

extension MainViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView.tag == 0 {
            guard let forecast = forecast else { return 0 }
            
            return forecast.threeHourDuringThreeDays.count
        } else {
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThreeHourCollectionViewCell.identifier, for: indexPath) as! ThreeHourCollectionViewCell
            
            cell.receiveData(data: forecast?.threeHourDuringThreeDays[indexPath.item])
            
            return cell
        } else {
            return UICollectionViewCell()
        }
        
    }
}

extension MainViewController : MKMapViewDelegate {
    
}
