//
//  ViewController.swift
//  OpenWeather
//
//  Created by JinwooLee on 2/11/24.
//

import UIKit

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
            
            print(self.forecast?.fiveDaysFromMinMiax)
        }
    }
}

extension MainViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if tableView == mainView.mainTableView {
            return indexPath.row == 0 ? UITableView.automaticDimension : 200
        } else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == mainView.mainTableView {
            return 3
        } else {
            return 5
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if tableView == mainView.mainTableView {
            if indexPath.row  == 0 { //MARK: - TopTableView
                let cell = tableView.dequeueReusableCell(withIdentifier: TopTableViewCell.identifier, for: indexPath) as! TopTableViewCell
                
                cell.receiveData(data: current)
                
                return cell
            } else if indexPath.row == 1 { //MARK: - Three Hour
                let cell = tableView.dequeueReusableCell(withIdentifier: ThreeHourTableViewCell.identifier, for: indexPath) as! ThreeHourTableViewCell
                
                cell.tempCollectionView.delegate = self
                cell.tempCollectionView.dataSource = self
                
                return cell
            } else if indexPath.row == 2 { //MARK: - Five Days
                let cell = tableView.dequeueReusableCell(withIdentifier: FiveDaysTableViewCell.identifier, for: indexPath) as! FiveDaysTableViewCell
                
                cell.tempTableView.delegate = self
                cell.tempTableView.dataSource = self
                
                return cell
            } else {
                
                return UITableViewCell()
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: FivewDaysSubTableViewCell.identifier, for: indexPath)
            
            return cell
        }
        

    }
}

extension MainViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThreeHourCollectionViewCell.identifier, for: indexPath)
        
        return cell
        
    }
    
    
}
