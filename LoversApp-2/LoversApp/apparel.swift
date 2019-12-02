//
//  apparel.swift
//  LoversApp
//
//  Created by User19 on 2019/11/28.
//  Copyright © 2019 SHIH-YING PAN. All rights reserved.
//

import Foundation


struct apparel: Identifiable, Codable {
    var id = UUID()
    var name: String
    var cost: Int
    //var trueHeart: Bool
}
