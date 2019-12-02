//
//  ApparelRow.swift
//  LoversApp
//
//  Created by User19 on 2019/11/28.
//  Copyright © 2019 SHIH-YING PAN. All rights reserved.
//

import SwiftUI

struct ApparelRow: View {
    var Apparel: apparel

    var body: some View {
        HStack {
            Text(Apparel.name)
            Spacer()
            Text("\(Apparel.cost) 元")
            //Image(systemName: lover.trueHeart ? "heart.fill" : "heart")
        }
        
    }
}

struct ApparelRow_Previews: PreviewProvider {
    static var previews: some View {
        ApparelRow(Apparel: apparel(name: "penny", cost: 30))
    }
}
