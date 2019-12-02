//
//  Lover.swift
//  LoversApp
//
//  Created by SHIH-YING PAN on 2019/11/13.
//  Copyright © 2019 SHIH-YING PAN. All rights reserved.
//

import Foundation


struct Lover: Identifiable, Codable {
    var id = UUID()
    var name: String
    var costfood: Int
    var costapparel: Int
    var costdaily: Int
    var costtraffic: Int
    var costentertainment: Int
    //var trueHeart: Bool
}

