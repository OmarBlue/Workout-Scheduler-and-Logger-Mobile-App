//
//  AllWorkoutScreen.swift
//  Mobile App Coursework
//
//  Created by Latitude on 19/01/2023.
//

import SwiftUI

struct AllWorkoutScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var workout = Workouts()
    
    var body: some View {
        NavigationView {
            VStack(spacing:20) {
                ZStack(alignment: .topLeading) {
                    Color.white
                        .edgesIgnoringSafeArea(.all)
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.blue)
                            .padding(25)
                            .font(.title2)
                    })
                    
                }
                .frame(minHeight: 15, maxHeight:15)
                
                Text("All Workout Schedules")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, maxHeight: 90.0)
                    .frame(height: 90.0)
                    .background(Color(hue: 0.58, saturation: 0.799, brightness: 0.91))
                ScrollView {
                    
                    ForEach(workout.workoutItem.sorted(by: { $0.workoutRemindDate < $1.workoutRemindDate })) { work in
                        VStack(spacing:5)  {
                            Text(work.workoutRemindDate, style: .date)
                                .font(.title2.bold())
                            ForEach(work.remind) { workout1 in
                                VStack(alignment: .leading, spacing: 10) {
                                    Text(workout1.time.addingTimeInterval(CGFloat.random(in: 0...5000)), style: .time)
                                    Text(workout1.title)
                                        .font(.title2.bold())
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            ForEach(work.workout) { workout in
                                Text(workout.name)
                                    .font(.title3)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color(hue: 0.58, saturation: 0.871, brightness:
                                            0.945).opacity(0.5).cornerRadius(10))
                    }
                    
                }
                
                Spacer()
            }
        }
    }
    }


struct AllWorkoutScreen_Previews: PreviewProvider {
    static var previews: some View {
        AllWorkoutScreen()
    }
}


