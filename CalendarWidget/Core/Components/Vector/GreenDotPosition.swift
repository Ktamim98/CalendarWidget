//
//  GreenDotPosition.swift
//  Calendar
//
//  Created by Tamim Khan on 12/7/23.
//

import SwiftUI

struct GreenDotPosition: View {
    var body: some View {
        Image("green")
          .offset(x: -160, y: 60)
        
        Image("green")
          .offset(x: -150, y: 120)
        
        Image("green")
          .offset(x: -150, y: 160)
        
        Image("green")
          .offset(x: -100, y: 170)
        
        Image("green")
          .offset(x: -25, y: 170)
    }
}

struct GreenDotPosition_Previews: PreviewProvider {
    static var previews: some View {
        GreenDotPosition()
    }
}
