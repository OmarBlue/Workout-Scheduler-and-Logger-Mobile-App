//
//  ContentView.swift
//  Mobile App Coursework
//
//  Created by Omar Aratuc on 15/12/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State public var dateCurrently = Date()
    @State private var showWorkoutPopUp: Bool = false
    @State private var showAddWorkoutPopUp: Bool = false
    @State var refresh: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                Text("Workout Planner")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, maxHeight: 90.0)
                    .frame(height: 90.0)
                    .background(Color(hue: 0.58, saturation: 0.799, brightness: 0.91))
                VStack(spacing: 10) {
                    DatePicker(dateCurrently: $dateCurrently)
                }
                .padding(.vertical)
            }
            .safeAreaInset(edge: .bottom) {
                HStack {
                    Button(action: {
                        showAddWorkoutPopUp.toggle()
                    }, label: {
                        Text("Add New Workout")
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(Color(hue: 0.58, saturation: 0.799, brightness: 0.91), in: Capsule())
                    })
                    .sheet(isPresented: $showAddWorkoutPopUp, onDismiss: {
                        self.update()
                      }, content: {
                        AddWorkout(dateCurrently2: $dateCurrently)
                        
                    })
                    
                    Button(action: {
                        showWorkoutPopUp.toggle()
                    }, label: {
                        Text("Workouts")
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(Color(hue: 0.388, saturation: 0.762, brightness: 0.862), in: Capsule())
                    })
                    .sheet(isPresented: $showWorkoutPopUp, content: {
                        AllWorkoutScreen()
                        
                    })
                }
                .padding(.horizontal)
                .padding(.top, 10)
                .foregroundColor(.white)
            }

        }
        .background(Color.clear.disabled(refresh))
        .onAppear() {
            self.update()
        }
    }
    
    func update() {
       refresh.toggle()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct DatePicker: View {
    @Binding var dateCurrently: Date
    @State var monthCurrently: Int = 0
    @ObservedObject var workout1 = Workouts()
   
    
    var body: some View {
        VStack(spacing: 5) {
            let daysWeek: [String] = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]
            
            HStack(spacing: 15) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(additionalDate()[0])
                        .font(.caption)
                        .fontWeight(.semibold)
                    Text(additionalDate()[1])
                        .font(.title)
                        .fontWeight(.bold)
                }
                Spacer()
                
                Button(action: {
                    withAnimation {
                        monthCurrently -= 1
                    }
                }, label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.blue)
                })
                
                Button(action: {
                    withAnimation {
                        monthCurrently += 1
                    }
                }, label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                        .foregroundColor(.blue)
                })
            }
            .padding(.horizontal)
            
            HStack(spacing: 5) {
                ForEach(daysWeek, id: \.self) { day in
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
            }
            let dateColumns = Array(repeating: GridItem(.flexible()), count: 7)
                
            LazyVGrid(columns: dateColumns, spacing: 15) {
                    ForEach(getDate()) { value in
                        CardView(value : value)
                            .background(
                                Circle()
                                    .fill(Color(hue: 0.58, saturation: 0.799, brightness: 0.91))
                                    .padding(.horizontal,0)
                                    .opacity(SameDay(date1: value.date, date2: dateCurrently) ? 1 : 0)
                                    .frame(width: 50, height: 60)
                            ).onTapGesture {
                                dateCurrently = value.date
                            }
                    }
                }
                VStack(spacing: 15) {
                    
                    Text("Workout Routine:")
                        .font(.title2.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 5)
                    
                    if let workout = workout1.workoutItem.first(where: { workout in
                        return SameDay(date1: workout.workoutRemindDate,date2: dateCurrently)
                    }) {
                        Group {
                            VStack(spacing:5) {
                                ForEach(workout.remind) { workout in
                                    VStack(alignment: .leading, spacing: 10) {
                                        Text(workout.time.addingTimeInterval(CGFloat.random(in: 0...5000)), style: .time)
                                        Text(workout.title)
                                            .font(.title2.bold())
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                ForEach(workout.workout) { workout in
                                    Text(workout.name)
                                        .font(.title3)
                                        .multilineTextAlignment(.center)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(5)
                                }
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color(hue: 0.58, saturation: 0.799, brightness: 0.91).opacity(0.5).cornerRadius(10))
                        }
                    }
                    else {
                        Text("No Workout Added!")
                    }
                }
                .padding()
            }
            .onChange(of: monthCurrently) {
                newValue in dateCurrently = getMonthCurrently()
            }
        }
        
        @ViewBuilder
        func CardView(value: DateValue) -> some View {
            VStack {
                if value.day != -1 {
                    if let workout = workout1.workoutItem.first(where: { workout in
                        return SameDay(date1: workout.workoutRemindDate, date2: value.date)
                    }) {
                        Text("\(value.day)")
                            .font(.title3.bold())
                            .foregroundColor(SameDay(date1: workout.workoutRemindDate, date2: dateCurrently) ? .white: .primary)
                        Spacer()
                        Circle()
                            .fill(SameDay(date1: workout.workoutRemindDate, date2: dateCurrently) ? .white : Color(hue: 0.58, saturation: 0.799, brightness: 0.91))
                            .frame(width: 8 , height: 8)
                    } else {
                        Text("\(value.day)")
                            .font(.title3.bold())
                            .foregroundColor(SameDay(date1: value.date, date2: dateCurrently) ? .white : .primary)
                        Spacer()
                    }
                }
            }
            .padding(.vertical, 10)
            .frame(height: 60, alignment: .top)

        }
    
        
        func SameDay(date1: Date, date2: Date)->Bool{
            let calendar = Calendar.current
            return calendar.isDate(date1, inSameDayAs: date2 )
        }
        func additionalDate()->[String] {
            let calendar = Calendar.current
            let month = calendar.component(.month, from: dateCurrently) - 1
            let year = calendar.component(.year, from: dateCurrently)
            
            return ["\(year)",calendar.monthSymbols[month]]
        }
        
        func getMonthCurrently()->Date {
            let calendar = Calendar.current
            guard let monthCurrently = calendar.date(byAdding: .month, value: self.monthCurrently, to: Date()) else {
                return Date()
            }
            return monthCurrently
        }
        
        func getDate()->[DateValue] {
            let calendar = Calendar.current
            let monthCurrently = getMonthCurrently()
            var daysWeek = monthCurrently.getAllTheDates().compactMap { date -> DateValue in
                let day = calendar.component(.day, from: date)
                return DateValue(day: day, date: date)
            }
            let weekDayFirst = calendar.component(.weekday, from: daysWeek.first!.date)
            
            for _ in 0..<weekDayFirst - 1{
                daysWeek.insert(DateValue(day: -1, date: Date()), at: 0)
            }
            return daysWeek
        }
    
    }


struct DateValue: Identifiable {
    var id = UUID().uuidString
    var day: Int
    var date: Date
}

extension Date {
    func getAllTheDates()->[Date] {
        let calendar = Calendar.current
        let startingDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from:self))!
        let range = calendar.range(of: .day, in: .month, for: startingDate)!
        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startingDate)!
        }
    }
}

