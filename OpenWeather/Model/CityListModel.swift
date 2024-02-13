//
//  CityListModel.swift
//  OpenWeather
//
//  Created by JinwooLee on 2/14/24.
//

import UIKit

/*
 {
 "id": 1832008,
 "name": "Tokusan-ri",
 "state": "",
 "country": "KR",
 "coord": {
     "lon": 128.699997,
     "lat": 35.133331
 }
 */

struct CityList : Decodable {
    let id : Int
    let name, state, country : String
//    let coord : [Coord]
    
    static func load(fileName : String) -> Data? {
        // 1. 불러올 파일 이름
        let fileName: String = fileName
        // 2. 불러올 파일의 확장자명
        let extensionType = "json"
        
        // 3. 파일 위치
        guard let fileLocation = Bundle.main.url(forResource: fileName, withExtension: extensionType) else { return nil }
        
        
        do {
            let data = try Data(contentsOf: fileLocation)
            return data
        } catch {

            return nil
        }
    }

}

typealias CityListModel = [CityList]


