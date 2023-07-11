//
//  CalendarWidget.swift
//  CalendarWidget
//
//  Created by Tamim Khan on 11/7/23.
//

import WidgetKit
import SwiftUI
import Intents


struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> MonthEntry {
        MonthEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (MonthEntry) -> ()) {
        let entry = MonthEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [MonthEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = MonthEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct MonthEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct CalendarWidgetEntryView: View {
    var entry: Provider.Entry
   
    
    var body: some View {
        ZStack{
            VStack{
                    VStack(alignment: .leading, spacing: 4){
                        HStack{
                            Image("Group 1")
                                .scaledToFit()
                                .frame(width: 22.19388, height: 15.53571)
                            
                            Text("Cloudy")
                              .font(Font.custom("Jacques Francois Shadow", size: 16.27551))
                              .foregroundColor(.black)
                        }
                        .padding(.top)
                        
                        
                        Text("19.2°")
                          .font(Font.custom("Arial Rounded MT Bold", size: 40.58817))
                          .offset(x: 5)
                          .multilineTextAlignment(.center)
                          .foregroundColor(.black)
                        
                        Text("WEDNESDAY")
                          .font(Font.custom("jsMath-cmbx10", size: 19.4029))
                          .multilineTextAlignment(.center)
                          .foregroundColor(.black)
                    }
                    .offset(y: 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.leading)
                  
              Spacer()
                
                    Text("September")
                      .offset(x: 70, y: -20)
                      .font(Font.custom("BacasimeAntique-Regular", size: 21.56863))
                      .multilineTextAlignment(.center)
                      .foregroundColor(.black)
                     
                ZStack{
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 291, height: 153)
                      .cornerRadius(15)
                      .shadow(color: .black.opacity(0.58), radius: 2, x: 4, y: 4)
                      .overlay(
                        RoundedRectangle(cornerRadius: 15)
                          .stroke(.black, style: StrokeStyle(lineWidth: 5, dash: [1, 1]))
                      )
                     
                    
                   
                }
                .offset(x: 10, y: -25)
                
                HStack(spacing: 20){
                    Image("Group 628")
                      .frame(width: 20, height: 20)
                    
                    Text("92%")
                      .font(Font.custom("Salsa", size: 22))
                      .multilineTextAlignment(.center)
                      .foregroundColor(.black)
                }
                .offset(x: 80, y: -30)
                
                HStack(spacing: 15){
                    Image("Frame")
                      .frame(width: 37, height: 37)
                    
                    Text("14km/h")
                      .font(
                        Font.custom("SairaSemiCondensed-Regular", size: 21.26582)
                          .weight(.medium)
                      )
                      .multilineTextAlignment(.center)
                      .foregroundColor(.black)
                }
                .offset(x: 90, y: -50)
            
            }
        }
        .frame(width: 338, height: 354)
        .background(Color(red: 0.8, green: 1, blue: 0))
        .overlay {
            
            Image("Group 815")
              .offset(x: 100, y: -130)
            
            Image("Vector1")
              .offset(x: -155, y: 70)
            
            Image("Vector2")
              .offset(x: -148, y: 130)
            
            Image("Vector3")
              .offset(x: -140, y: 160)
            
            Image("Vector4")
              .offset(x: -110, y: 160)
            
            Image("Vector5")
              .offset(x: -80, y: 160)
            
            Image("Vector6")
               .offset(x: -30, y: 155)
            
            
            
        }
    }
}

struct CalendarWidget: Widget {
    let kind: String = "CalendarWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            CalendarWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemLarge])
    }
}

struct CalendarWidget_Previews: PreviewProvider {
    static var previews: some View {
        CalendarWidgetEntryView(entry: MonthEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
           
    }
}


