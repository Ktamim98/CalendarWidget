//
//  DateValue.swift
//  Calendar
//
//  Created by Tamim Khan on 12/7/23.
//

import SwiftUI

struct DateValue: Identifiable{
    var id = UUID().uuidString
    var day: Int
    var date: Date
    var isCurrentDate: Bool
}
