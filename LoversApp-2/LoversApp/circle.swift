//
//  circle.swift
//  LoversApp
//
//  Created by User19 on 2019/11/28.
//  Copyright © 2019 SHIH-YING PAN. All rights reserved.
//

import SwiftUI

struct circle: View {
    var body: some View {
        ZStack{
            Path{(path) in
                path.move(to: CGPoint(x:200,y:200))
                path.addArc(center:CGPoint(x:200,y:200),radius:100,startAngle: .degrees(0), endAngle: .degrees(360*(7/24)),clockwise:false)
                
            }
            .fill(Color.red)
            Path{(path) in
                path.move(to: CGPoint(x:200,y:200))
                path.addArc(center:CGPoint(x:200,y:200),radius:100,startAngle: .degrees(360*(7/24)), endAngle: .degrees(360*(12/24)),clockwise:false)
                
            }
            .fill(Color.blue)
            Path{(path) in
                path.move(to: CGPoint(x:200,y:200))
                path.addArc(center:CGPoint(x:200,y:200),radius:100,startAngle: .degrees(360*(12/24)), endAngle: .degrees(360*(15/24)),clockwise:false)
                
            }
            .fill(Color.yellow)
            Path{(path) in
                path.move(to: CGPoint(x:200,y:200))
                path.addArc(center:CGPoint(x:200,y:200),radius:100,startAngle: .degrees(360*(15/24)), endAngle: .degrees(360*(19/24)),clockwise:false)
                
            }
            .fill(Color.purple)
            Path{(path) in
                path.move(to: CGPoint(x:200,y:200))
                path.addArc(center:CGPoint(x:200,y:200),radius:100,startAngle: .degrees(360*(19/24)), endAngle: .degrees(360*(24/24)),clockwise:false)
                
            }
            .fill(Color.green)
        }
    }
}

struct circle_Previews: PreviewProvider {
    static var previews: some View {
        circle()
    }
}
