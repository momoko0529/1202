//
//  apparelData.swift
//  LoversApp
//
//  Created by User19 on 2019/11/28.
//  Copyright © 2019 SHIH-YING PAN. All rights reserved.
//

import Foundation

class apparelData: ObservableObject {
    
    @Published var apparels = [apparel]() {
        didSet {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(apparels) {
                UserDefaults.standard.set(data, forKey: "lovers")
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "apparels") {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([apparel].self, from: data) {
                apparels = decodedData
            }
        }
    }
    
}

