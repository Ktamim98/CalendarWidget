//
//  WeatherResponse.swift
//  WeatherWidgetExtension
//
//  Created by Tamim Khan on 13/7/23.
//

import Foundation


struct WeatherResponse: Codable{
    let forecast: [Weather]
}
