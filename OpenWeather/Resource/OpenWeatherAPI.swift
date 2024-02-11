//
//  OpenWeatherAPI.swift
//  OpenWeather
//
//  Created by JinwooLee on 2/11/24.
//

import UIKit
import Alamofire

enum OpenWeatherAPI {
    
    static let baseUrl = "https://api.openweathermap.org/data/2.5/"
    static let method : HTTPMethod = .get
    
    //MARK: - Error 관련 Enum
    enum APIError : Error {
        case failedRequeset
        case noData
        case invalidResponse
        case invalidData
        case invalidDecodable
    }
    
    case current(id : String)
    case forecast(id : String)
    
    var endPoint : URL {
        switch self {
        case .current:
            return URL(string: OpenWeatherAPI.baseUrl + "weather")!
        case .forecast:
            return URL(string: OpenWeatherAPI.baseUrl + "forecast")!
        }
    }

    var parameter : Parameters {
        switch self {
        case .current(let id),.forecast(let id):
            return ["appid":API.OpenWeatherKey, "id":id]
        }
    }
    
    
}
