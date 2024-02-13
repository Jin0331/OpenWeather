//
//  SearchViewController.swift
//  OpenWeather
//
//  Created by JinwooLee on 2/13/24.
//

import UIKit

final class SearchViewController: BaseViewController {

    let mainView = SearchView()
    
    var idSpace : ((Int) -> Void)?
    
    var dataList : CityListModel = CityListModel(){
        didSet {
            mainView.mainTableView.reloadData()
        }
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.mainTableView.dataSource = self
        mainView.mainTableView.delegate = self
        
        guard let jsonData = CityList.load(fileName: "CityList"),
              let cityList = try? JSONDecoder().decode(CityListModel.self, from: jsonData)
        else { print("error");return }
        
        self.dataList = cityList

    }

}

extension SearchViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as! SearchTableViewCell
        
        cell.receiveData(data: dataList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! SearchTableViewCell
        
        idSpace?(cell.id)
        
        navigationController?.popViewController(animated: true)
        
    }
    
    
}
