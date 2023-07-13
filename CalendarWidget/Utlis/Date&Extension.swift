//
//  Date&Extension.swift
//  WeatherWidgetExtension
//
//  Created by Tamim Khan on 13/7/23.
//

import Foundation


extension Date{
    func timeOnly() -> String{
        let fromDate = self
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: fromDate)
    }
}
