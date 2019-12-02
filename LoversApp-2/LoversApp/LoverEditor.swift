//
//  LoverEditor.swift
//  LoversApp
//
//  Created by SHIH-YING PAN on 2019/11/13.
//  Copyright © 2019 SHIH-YING PAN. All rights reserved.
//

import SwiftUI

struct LoverEditor: View {
    @Environment(\.presentationMode) var presentationMode
    var loversData: LoversData
    //var apparelData: apparelData
    @State private var name = ""
    @State private var costfood = 30
    @State private var costapparel = 1
    @State private var costdaily = 1
    @State private var costtraffic = 1
    @State private var costentertainment = 1
    //@State private var trueHeart = true
    var editLover: Lover?
    
    
    var body: some View {
        Form {
            TextField("名稱", text: $name)
            Stepper("食 \(costfood) 元", value: $costfood, in: 0...10000)
            Stepper("衣 \(costapparel) 元", value: $costapparel, in: 1...10000)
            Stepper("住 \(costdaily) 元", value: $costdaily, in: 1...10000)
            Stepper("行 \(costtraffic) 元", value: $costtraffic, in: 1...10000)
            Stepper("樂 \(costentertainment) 元", value: $costentertainment, in: 1...10000)
            //Toggle("真心", isOn: $trueHeart)
        }
        .navigationBarTitle(editLover == nil ? "Add new lover" : "Edit lover")
        .navigationBarItems(trailing: Button("Save") {
            let lover = Lover(name: self.name, costfood: self.costfood ,costapparel:self.costapparel,costdaily:self.costdaily,costtraffic:self.costtraffic,costentertainment:self.costentertainment
                              //trueHeart: self.trueHeart)
            )
            if let editLover = self.editLover {
                let index = self.loversData.lovers.firstIndex {
                    $0.id == editLover.id
                    }!
                self.loversData.lovers[index] = lover
            } else {
                self.loversData.lovers.insert(lover, at: 0)
            }
            self.presentationMode.wrappedValue.dismiss()
            
        })
            .onAppear {
                if let editLover = self.editLover {
                    self.name = editLover.name
                    self.costfood = editLover.costfood
                    self.costapparel = editLover.costapparel
                    self.costdaily = editLover.costdaily
                    self.costtraffic = editLover.costtraffic
                    self.costentertainment = editLover.costentertainment
                    //self.trueHeart = editLover.trueHeart
                    
                }
        }
        
    }
    
}

struct LoverEditor_Previews: PreviewProvider {
    static var previews: some View {
        LoverEditor(loversData: LoversData())
        //LoverEditor(loversData: apparelData())
    }
}

