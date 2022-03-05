//
//  Order.swift
//  Restaurant_Eliasvand
//
//  Created by Faniz Eliasvand on 12/18/21.
//

import Foundation


struct Order: Codable {
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
