//
//  Country.swift
//  iOS_ProjectC_20230214
//
//  Created by 백래훈 on 2023/02/14.
//

import Foundation

struct Country: Codable {
    let koreanName: String
    let assetName: String
    
    enum CodingKeys: String, CodingKey {
        case koreanName = "korean_name"
        case assetName = "asset_name"
    }
}

// {"korean_name":"한국","asset_name":"kr"}
