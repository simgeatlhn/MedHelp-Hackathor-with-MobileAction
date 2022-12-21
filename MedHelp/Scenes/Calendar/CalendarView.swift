//
//  CalendarView.swift
//  MedHelp
//
//  Created by simge on 16.12.2022.
//

import SwiftUI

struct CalendarView: View {
    @State var selectedDate: Date = Date()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack() {
                    Text(selectedDate.formatted(date: .abbreviated, time: .omitted))
                        .font(.system(size: 28))
                        .bold()
                        .foregroundColor(mainColor)
                        .padding()
                        .animation(.spring(), value: selectedDate)
                        .frame(width: 500)
                    Divider()
                        .frame(height: 1)
                    DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                        .padding(.horizontal)
                        .datePickerStyle(.graphical)
                    Divider()
                    Spacer()
                }
                .padding(.vertical, 100)
            }
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
