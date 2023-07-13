//
//  WeatherTimeline.swift
//  WeatherWidgetExtension
//
//  Created by Tamim Khan on 13/7/23.
//

import WidgetKit
import SwiftUI



struct WeatherTimeline: TimelineProvider{
    
    typealias Entry = WeatherEntry
    
    
    func placeholder(in context: Context) -> WeatherEntry {
        let entry = WeatherEntry(date: Date(), weather: Weather(name: "SF", temperature: 67, unit: "F", description: "Cloudy"))
       return entry
    }
    
    func getSnapshot(in context: Context, completion: @escaping (WeatherEntry) -> Void) {
        let entry = WeatherEntry(date: Date(), weather: Weather(name: "SF", temperature: 67, unit: "F", description: "Cloudy"))
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<WeatherEntry>) -> Void) {
        let currentDate = Date()
        let refreshDate = Calendar.current.date(byAdding: .minute, value: 15, to: currentDate)!
        
        WeatherService().getWeather { (result) in
            let weather: Weather
            
            if case.success(let fetchData) = result {
                weather = fetchData.first!
                
            }else{
                weather = Weather(name: "SF", temperature: 0, unit: "F", description: "Error getting weather info")
            }
            
            let entry = WeatherEntry(date: currentDate, weather: weather)
            let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
            completion(timeline)
        }
    }
    
   
    
}

