//
//  CustomCalendar.swift
//  Calendar
//
//  Created by Tamim Khan on 12/7/23.
//

import SwiftUI

struct CustomCalendar: View {
    
    @Binding var currentDate: Date
    
    @State var currentMonth: Int = 0
    
    var body: some View {
        VStack(spacing: 5){
            
            let days: [String] = ["M", "T", "W", "T", "F", "S", "S"]
            
           
                
                
                HStack(spacing: 6){
                    ForEach(days, id: \.self){ day in
                        
                        Text(day)
                            .font(Font.custom("Irish Grover", size: 14))
                            .foregroundColor(Color(red: 0, green: 0.1, blue: 1))
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                    }
                }
            
            
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            
            LazyVGrid(columns: columns, spacing: 8){
                
                ForEach(extractDate()){ value in
                    
                    CardView(value: value)
                       
                    
                }
                
            }
            
            
            
        }
    }
    
    @ViewBuilder
    func CardView(value: DateValue) -> some View{
        VStack {
               if value.day != -1 {
                   Text("\(value.day)")
                       .font(Font.custom("Irish Grover", size: 14))
                       .foregroundColor(value.isCurrentDate ? .white : .primary)
                       .background(
                           ZStack {
                               Circle()
                                   .fill(value.isCurrentDate ? Color.black : Color.clear)
                                   .frame(width: 30, height: 30)
                           }
                       )
               }
           }
//           .padding(.vertical, 8)
//           .frame(height: 60, alignment: .top)
    }
    
    
    func getCurrentMonth() -> Date{
        let calendar = Calendar.current
        
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else {
            return Date()
        }
        
        return currentMonth
    }
    
    
    func extractDate() -> [DateValue] {
        let calendar = Calendar.current
        
        let currentMonth = getCurrentMonth()
        
        let currentDate = calendar.startOfDay(for: Date())
        
        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            let day = calendar.component(.day, from: date)
            let isCurrentDate = calendar.isDate(date, inSameDayAs: currentDate)
            
            return DateValue(day: day, date: date, isCurrentDate: isCurrentDate)
        }
        
        let firstWeekDay = calendar.component(.weekday, from: days[6].date)
        
        for _ in 0..<firstWeekDay - 1 {
            days.insert(DateValue(day: -1, date: Date(), isCurrentDate: true), at: 0)
        }
        return days
    }

}

struct CustomCalendar_Previews: PreviewProvider {
    static var previews: some View {
        ContenttView()
    }
}


extension Date{
    func getAllDates() -> [Date]{
        let calendar = Calendar.current
        
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        
        var range = calendar.range(of: .day, in: .month, for: startDate)!
        
        range.removeLast()
        
        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}
