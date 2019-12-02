//
//  LoverRow.swift
//  LoversApp
//
//  Created by SHIH-YING PAN on 2019/11/13.
//  Copyright © 2019 SHIH-YING PAN. All rights reserved.
//

import SwiftUI

struct LoverRow: View {
    
    var lover: Lover

    var body: some View {
        HStack {
            Text(lover.name)
            Spacer()
            Text("飲食\(lover.costfood) ,服飾\(lover.costapparel) ,住宿/日用\(lover.costdaily) ,交通\(lover.costtraffic) ,娛樂\(lover.costentertainment) 元")
            
            //Image(systemName: lover.trueHeart ? "heart.fill" : "heart")
        }
        
    }
}

struct LoverRow_Previews: PreviewProvider {
    static var previews: some View {
        LoverRow(lover: Lover(name: "penny", costfood: 30, costapparel: 1,costdaily:20,costtraffic:20,costentertainment:20))
    }
}
