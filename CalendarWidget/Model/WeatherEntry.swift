//
//  WeatherEntry.swift
//  WeatherWidgetExtension
//
//  Created by Tamim Khan on 13/7/23.
//

import WidgetKit
import SwiftUI


struct WeatherEntry: TimelineEntry{
    public let date: Date
    public let weather: Weather
    
    var relevance: TimelineEntryRelevance?{
        return TimelineEntryRelevance(score: 50)
    }
}
