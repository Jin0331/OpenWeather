//
//  CommonModel.swift
//  OpenWeather
//
//  Created by JinwooLee on 2/11/24.
//

import Foundation


// MARK: - Clouds
struct Clouds: Decodable {
    let all: Int
}

// MARK: - Coord
struct Coord: Decodable {
    let lat: Double
    let lon: Double
}

// MARK: - Sys
struct Sys: Decodable {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
    
    enum CodingKeys: CodingKey {
        case type
        case id
        case country
        case sunrise
        case sunset
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = (try? container.decode(Int.self, forKey: .type)) ?? -999
        self.id = (try? container.decode(Int.self, forKey: .id)) ?? -999
        self.country = (try? container.decode(String.self, forKey: .country)) ?? ""
        self.sunrise = (try? container.decode(Int.self, forKey: .sunrise)) ?? -999
        self.sunset = (try? container.decode(Int.self, forKey: .sunset)) ?? -999
    }
}

// MARK: - Weather
struct Weather: Decodable {
    let id: Int
    let mainDescription, description, icon: String
    
    enum CodingKeys : String, CodingKey {
        case mainDescription = "main"
        case id, description, icon
    }
}

// MARK: - Wind
struct Wind: Decodable {
    let speed: Double
    let deg: Int
}

// MARK: - Main
struct MainData : Decodable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Int
    let tempKf: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case tempKf = "temp_kf"
        case pressure, humidity
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.temp = try container.decode(Double.self, forKey: .temp)
        self.feelsLike = try container.decode(Double.self, forKey: .feelsLike)
        self.tempMin = try container.decode(Double.self, forKey: .tempMin)
        self.tempMax = try container.decode(Double.self, forKey: .tempMax)
        self.seaLevel = (try? container.decode(Int.self, forKey: .seaLevel)) ?? -999
        self.grndLevel = (try? container.decode(Int.self, forKey: .grndLevel)) ?? -999
        self.tempKf = (try? container.decode(Double.self, forKey: .tempKf)) ?? -999
        self.pressure = try container.decode(Int.self, forKey: .pressure)
        self.humidity = try container.decode(Int.self, forKey: .humidity)
    }
    
    var tempConvert : String {
        get {
            return String(format: "%.0f", temp-273.15)
        }
    }
    
    var tempMinConvert : String {
        get {
            return String(format: "%.1f", tempMin-273.15)
        }
    }
    
    var tempMaxConvert : String {
        get {
            return String(format: "%.1f", tempMax-273.15)
        }
    }
    
    var feelsLikeConvert : String {
        get {
            return String(format: "%.1f", feelsLike-273.15)
        }
    }
    
    var pressureConvert : String {
        get {
            
            let numberFormatter: NumberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal

            return numberFormatter.string(for: Int(pressure))!
        }
    }
}
