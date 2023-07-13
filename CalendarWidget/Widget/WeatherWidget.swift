//
//  WeatherWidget.swift
//  WeatherWidget
//
//  Created by Tamim Khan on 13/7/23.
//

import WidgetKit
import SwiftUI



struct WeatherWidget: Widget{
    private var kind: String = "WeatherWidget"
    
    var body: some WidgetConfiguration{
        StaticConfiguration(kind: kind, provider: WeatherTimeline()) { entry in
            WeatherEntryView(entry: entry)
        }
        .supportedFamilies([.systemLarge])
        .configurationDisplayName("Weather Widget")
        .description("Widget Display current Weather")
    }
}

