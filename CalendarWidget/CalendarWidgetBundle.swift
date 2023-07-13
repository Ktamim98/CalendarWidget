//
//  CalendarWidgetBundle.swift
//  CalendarWidget
//
//  Created by Tamim Khan on 11/7/23.
//

import WidgetKit
import SwiftUI

@main
struct CalendarWidgetBundle: WidgetBundle {
    var body: some Widget {
        WeatherWidget()
        CalendarWidgetLiveActivity()
    }
}
