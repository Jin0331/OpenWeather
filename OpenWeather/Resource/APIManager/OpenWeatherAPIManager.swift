//
//
//  OpenWeatherAPIManager.swift
//  OpenWeather
//
//  Created by JinwooLee on 2/11/24.
//

//TODO: - URL Session 사용??? 우선 AF
//TODO: - Error handling 추가되어야 함

import UIKit
import Alamofire

final class OpenWeatherAPIManager {
    
    static let shared = OpenWeatherAPIManager()
    
    private init () {}
    
    func fetch<T : Decodable>(api : OpenWeatherAPI, completionHandler : @escaping (T) -> Void) {
        
        AF.request(api.endPoint,
                   method: OpenWeatherAPI.method,
                   parameters: api.parameter,
                   encoding: URLEncoding(destination: .queryString)
        )
        .responseDecodable(of: T.self) { response in
            
            switch response.result {
            case .success(let success):
                print("조회 성공")
                
                completionHandler(success)
                
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
