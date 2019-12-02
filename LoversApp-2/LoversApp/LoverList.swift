//
//  LoverList.swift
//  LoversApp
//
//  Created by SHIH-YING PAN on 2019/11/13.
//  Copyright © 2019 SHIH-YING PAN. All rights reserved.
//

import SwiftUI

struct LoverList: View {
    
    @ObservedObject var loversData = LoversData()
    @State private var showEditLover = false
    @State private var spendfood = 7000
    @State private var spendapparel = 5000
    @State private var spenddaily = 3000
    @State private var spendtraffic = 4000
    @State private var spendentertainment = 5000
    @State private var rotateDegree: Double = 0
    @State private var abc = false
    
    var love: Lover
    
    var body: some View {
        NavigationView {
            
            VStack{
                HStack{
                Button("預算"){
                    self.rotateDegree = 360
                }
                Button("圓餅圖"){
                    self.abc = true
                }
                .sheet(isPresented: self.$abc){
                    circle()
                    }
                }
                ZStack{
                Group{
                  Circle()
                  .trim(from: 0,to:7/24)
                    .stroke(Color.red,lineWidth:30)
                  Circle()
                  .trim(from: 7/24,to:12/24)
                    .stroke(Color.blue,lineWidth:30)
                  Circle()
                  .trim(from: 12/24,to:15/24)
                    .stroke(Color.yellow,lineWidth:30)
                  Circle()
                    .trim(from: 15/24,to:19/24)
                    .stroke(Color.purple,lineWidth:30)
                  Circle()
                  .trim(from: 19/24,to:24/24)
                    .stroke(Color.green,lineWidth:30)
                    }
                    .rotationEffect(Angle(degrees: rotateDegree))
                    .animation(Animation.linear(duration: 10).repeatForever(autoreverses: false))
                    VStack{
                        Text("食")
                            .foregroundColor(Color.red)
                        Text("衣")
                        .foregroundColor(Color.blue)
                        Text("住")
                        .foregroundColor(Color.yellow)
                        Text("行")
                        .foregroundColor(Color.purple)
                        Text("樂")
                        .foregroundColor(Color.green)
                    }
                }
                HStack{
                    Text("食:\(self.spendfood-self.love.costfood) 衣:\(self.spendapparel-self.love.costapparel) 住:\(self.spenddaily-self.love.costdaily) 行:\(self.spendtraffic-self.love.costtraffic) 樂:\(self.spendentertainment-self.love.costentertainment)")
                }
                                   
            List {
                
               ForEach(loversData.lovers) { (lover) in
                        NavigationLink(destination: LoverEditor(loversData: self.loversData, editLover: lover)) {
                            LoverRow(lover: lover)
                            
                        }
                    }
                    .onDelete { (indexSet) in
                        self.loversData.lovers.remove(atOffsets: indexSet)
                    }
                }
                .navigationBarTitle("花費")
                .navigationBarItems(leading: EditButton() ,trailing: Button(action: {
                    
                    self.showEditLover = true
                    
                }, label: {
                    Image(systemName: "plus.circle.fill")
                    
                }))
                    .sheet(isPresented: $showEditLover) {
                        NavigationView {
                             LoverEditor(loversData: self.loversData)
                        }
                    }
                }
                    

                }
          
            }
            
}

struct LoverList_Previews: PreviewProvider {
    static var previews: some View {
        LoverList(love: Lover(name: "penny", costfood: 30, costapparel: 1,costdaily:20,costtraffic:20,costentertainment:20))
    }
}
