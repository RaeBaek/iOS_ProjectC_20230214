//
//  City.swift
//  iOS_ProjectC_20230214
//
//  Created by 백래훈 on 2023/02/14.
//

import Foundation

struct City: Codable {
    let cityName: String
    let state: Int
    let celsius: Double
    let rainfallProbability: Int
    
    var celAndFah: String {
        return "섭씨 \(self.celsius)도 / 화씨 \(self.celsius + 32)도"
    }

    var rainfallPercent: String {
        return "강수확률 \(self.rainfallProbability)%"
    }
    
    enum CodingKeys: String, CodingKey {
        case state, celsius
        case cityName = "city_name"
        case rainfallProbability = "rainfall_probability"
    }
    
}

/*
      "city_name":"베를린",
      "state":12,
      "celsius":10.8,
      "rainfall_probability":60
*/
