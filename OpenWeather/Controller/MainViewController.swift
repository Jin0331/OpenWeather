//
//  ViewController.swift
//  OpenWeather
//
//  Created by JinwooLee on 2/11/24.
//

import UIKit

final class ViewController: UIViewController {

    let mainView = MainView()
    
    var current : CurrentModel?
    var forecast : ForecastModel?
    
    let tempID = 1835847 // seoul,, 임시
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
                
                dump(self.forecast?.threeHourDuringThreeDays)
            }
        }
        
        group.notify(queue: .main) {
            print("조회 완료")
        }
        
    }


}

