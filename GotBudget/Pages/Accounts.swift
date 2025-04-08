//
//  Accounts.swift
//  GotBudget
//
//  Created by Matt McCoy on 4/7/25.
//

import SwiftUI
import SwiftData
import Charts

struct Accounts: View {
    @State private var selectedDate: Date?
    private let revenueHistory = mockHistory()
    private let gradient = Gradient(stops: [
      .init(color: .teal, location: 0),
      .init(color: .teal.opacity(0), location: 0.9)
    ])
    
    var body: some View {
      VStack {
          Chart {
              ForEach (revenueHistory) {  revenue in
                  // For gradient effect under the line chart
                  AreaMark(
                    x: .value("Date", revenue.date),
                    y: .value("Revenue", revenue.value)
                  )
                  .interpolationMethod(.cardinal)
                  .foregroundStyle(gradient)
                  
                  // Line chart
                  LineMark(
                    x: .value("Date", revenue.date),
                    y: .value("Revenue", revenue.value)
                  )
                  .lineStyle(StrokeStyle(lineWidth: 4, lineCap: .round))
                  .interpolationMethod(.cardinal)
              }
          }
        .padding()
        .foregroundStyle(.white)
        .frame(width: 400, height: 200)
        .cornerRadius(24)
        Spacer()
      }
    }
    
    static func mockHistory() -> [Revenue] {
      return [
        .init(date: daysFromNow(1), value: 6000),
        .init(date: daysFromNow(2), value: 9000),
        .init(date: daysFromNow(3), value: 4000),
        .init(date: daysFromNow(4), value: 10000),
        .init(date: daysFromNow(5), value: 12000),
        .init(date: daysFromNow(6), value: 14000),
        .init(date: daysFromNow(7), value: 16000),
        .init(date: daysFromNow(8), value: 17000)
      ]
    }
    
    static func daysFromNow(_ days: Int) -> Date {
      Calendar.current.date(byAdding: .day, value: days, to: .now)!
    }
    
  }

  struct Revenue: Identifiable {
    var id: Date { date }
    let date: Date
    let value: Double
  }

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
