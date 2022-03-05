//
//  IntermediaryModels.swift
//  Restaurant_Eliasvand
//
//  Created by Faniz Eliasvand on 12/18/21.
//

import Foundation


struct Categories: Codable {
    let categories: [String]
}

struct PreparationTime: Codable {
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}
