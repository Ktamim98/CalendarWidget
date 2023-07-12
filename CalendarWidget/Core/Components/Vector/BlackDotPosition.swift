//
//  BlackDotPosition.swift
//  Calendar
//
//  Created by Tamim Khan on 12/7/23.
//

import SwiftUI

struct BlackDotPosition: View {
    var body: some View {
        
            Image("blackball")
              .offset(x: -150, y: 95)
            
            Image("blackball")
              .offset(x: -120, y: 140)
            
            Image("blackball")
              .offset(x: -65, y: 150)
            
            Image("blackball")
              .offset(x: -0, y: 167)
    }
}

struct BlackDotPosition_Previews: PreviewProvider {
    static var previews: some View {
        BlackDotPosition()
    }
}
