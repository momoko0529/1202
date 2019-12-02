//
//  apparelEditor.swift
//  LoversApp
//
//  Created by User19 on 2019/11/28.
//  Copyright © 2019 SHIH-YING PAN. All rights reserved.
//

import SwiftUI

struct apparelEditor: View {
    @Environment(\.presentationMode) var presentationMode
    var apparelData: apparelData
    @State private var name = ""
    @State private var cost = 30
    //@State private var trueHeart = true
    var editapparel: apparel?
    var body: some View {
        Form {
                TextField("名稱", text: $name)
                Stepper("花費 \(cost) 元", value: $cost, in: 0...10000)
                //Toggle("真心", isOn: $trueHeart)
            }
            .navigationBarTitle(editapparel == nil ? "Add new lover" : "Edit lover")
            .navigationBarItems(trailing: Button("Save") {
                let Apparel = apparel(name: self.name, cost: self.cost //trueHeart: self.trueHeart)
                )
                if let editapparel = self.editapparel {
                    let index = self.apparelData.apparels.firstIndex {
                        $0.id == editapparel.id
                        }!
                    self.apparelData.apparels[index] = Apparel
                } else {
                    self.apparelData.apparels.insert(Apparel, at: 0)
                }
                self.presentationMode.wrappedValue.dismiss()
                
            })
                .onAppear {
                    if let editapparel = self.editapparel {
                        self.name = editapparel.name
                        self.cost = editapparel.cost
                        //self.trueHeart = editLover.trueHeart
                        
                    }
            }
            
        }
}

struct apparelEditor_Previews: PreviewProvider {
    static var previews: some View {
        apparelEditor(apparelData: apparelData())
    }
}
