//
//  CalendarView.swift
//  Calendar
//
//  Created by Tamim Khan on 12/7/23.
//

import SwiftUI

struct CalendarView: View {
    @State var currentDate: Date = Date()
    
    var body: some View {
        
        VStack(spacing: 20){
            CustomCalendar(currentDate: $currentDate)
                .frame(width: 290, height: 50)
        }
        
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
