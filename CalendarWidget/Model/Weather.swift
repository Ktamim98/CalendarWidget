//
//  Weather.swift
//  WeatherWidgetExtension
//
//  Created by Tamim Khan on 13/7/23.
//

import Foundation


struct Weather: Codable{
    let name: String
    let temperature: Int
    let unit: String
    let description: String
}
