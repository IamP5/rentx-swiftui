//
//  HorizonCalendar.swift
//  rentX
//
//  Created by Bruno Gabriel on 15/04/22.
//

import SwiftUI
import HorizonCalendar

struct HorizonCalendar: UIViewRepresentable {

    func makeUIView(context: Context) -> CalendarView {
        let calendarView = CalendarView(initialContent: makeContent())
        return calendarView
    }

    func updateUIView(_ uiView: CalendarView, context: UIViewRepresentableContext<HorizonCalendar>) {}

    private func makeContent() -> CalendarViewContent {
        let calendar = Calendar(identifier: .gregorian)
        let startDate = calendar.date(from: DateComponents(year: 2020, month: 01, day: 01))!
        let endDate = calendar.date(from: DateComponents(year: 2021, month: 12, day: 31))!
        return CalendarViewContent(
          calendar: calendar,
          visibleDateRange: startDate...endDate,
          monthsLayout: .vertical(options: VerticalMonthsLayoutOptions()))
    }
}
