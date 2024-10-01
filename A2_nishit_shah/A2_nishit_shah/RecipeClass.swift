//
//  RecipeClass.swift
//  A2_nishit_shah
//
//  Created by Nishit Shah on 2024-02-18.
//

import Foundation

class RecipeClass {
    static let shared = RecipeClass()
    var imageNames:[String] = ["EasyGuacamole","PolishNoodles","PumpkinDessert"]
    
    var selectedIndex = 0
    
    var totalTime:[Int] = [40,20,55]
    
}
