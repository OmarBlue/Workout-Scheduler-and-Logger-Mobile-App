//
//  AddWorkout.swift
//  Mobile App Coursework
//
//  Created by Latitude on 19/01/2023.
//

import SwiftUI

struct AddWorkout: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedWorkoutsDay = ""
    @State private var selectedWorkout1 = ""
    @State private var selectedWorkout2 = ""
    @State private var selectedWorkout3 = ""
    @State private var selectedWorkout4 = ""
    @State private var time = Date.now
    @Binding var dateCurrently2: Date
    @State private var showingAlert2 = false
    @ObservedObject var workout = Workouts()
    @State var workoutList = [Workout]()
    @State var remindList = [WorkoutReminder]()

    
    let workoutsDay = ["Leg Day", "Arm Day", "Back Day", "Shoulder Day", "Chest Day", "Upper Day", "Lower Day", "Push Day", "Pull Day"]
    let workoutsOption = ["Chin Up","Barbell Squat", "Deadlift", "Leg Extension", "Lunges", "Leg Press", "Leg Curl", "Incline Bicep Curl", "Dumbbell Curl", "Seated Row", "Bar Curl", "Skull Crusher", "Machine Chest Press", "Overhead Triceps Extension", "Pull Up", "Bent-Ocer Row", "Lat Pull Down", "Chest-Supported Row", "T-Bar Row", "Decline Press", "Dip", "Chest Fly", "Push Up", "Incline Bench Press", "Barbell Bench Press", "Overhead Press", "Push Press", "Barbell Shrug", "Lateral Raise", "Bent-Over Reverse Fly", "Arnold Press", "Upright Row", "Front Raises"].sorted()
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
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
                
                Text("Add Workout Schedules")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, maxHeight: 90.0)
                    .frame(height: 90.0)
                    .background(Color(hue: 0.58, saturation: 0.799, brightness: 0.91))
                
                
                VStack(spacing:1){
                    ScrollView(.vertical, showsIndicators: false) {

                        Text("Date: \(dateCurrently2, style: .date)")
                            .font(.title2)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(hue: 0.58, saturation: 0.939, brightness: 0.687))
                            .fontWeight(.bold)

                        
                        Group {
                            
                            Text("Workout Day:  \(selectedWorkoutsDay)")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .padding(.leading)
                                .font(.title)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, maxHeight: 90.0)
                                .frame(height: 50.0)
                                .background(Color(hue: 0.58, saturation: 0.939, brightness: 0.687))
                                .padding(10)
                                .padding(.bottom,0)
                            
                            
                            Picker("Select a workout day", selection: $selectedWorkoutsDay) {
                                ForEach(workoutsDay, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(.menu)
                            .padding(.leading)
                            .font(.title)
                            .frame(maxWidth: .infinity, maxHeight: 90.0)
                            .frame(height: 40.0)
                            .background(Color(hue: 0.58, saturation: 0.032, brightness: 0.847))
                            .padding(10)
                            
                        }
                        
                        Group {
                            Text("Workout 1:  \(selectedWorkout1)")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .padding(.leading)
                                .font(.title)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, maxHeight: 90.0)
                                .frame(height: 50.0)
                                .background(Color(hue: 0.58, saturation: 0.939, brightness: 0.687))
                                .padding(10)
                                .padding(.bottom,0)
                            
                            
                            Picker("Select the first workout", selection: $selectedWorkout1) {
                                ForEach(workoutsOption, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(.menu)
                            .padding(.leading)
                            .font(.title)
                            .frame(maxWidth: .infinity, maxHeight: 90.0)
                            .frame(height: 40.0)
                            .background(Color(hue: 0.58, saturation: 0.032, brightness: 0.847))
                            .padding(10)
                        }
                        
                        Group {
                            Text("Workout 2:  \(selectedWorkout2)")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .padding(.leading)
                                .font(.title)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, maxHeight: 90.0)
                                .frame(height: 50.0)
                                .background(Color(hue: 0.58, saturation: 0.939, brightness: 0.687))
                                .padding(10)
                                .padding(.bottom,0)
                            
                            
                            Picker("Select the second workout", selection: $selectedWorkout2) {
                                ForEach(workoutsOption, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(.menu)
                            .padding(.leading)
                            .font(.title)
                            .frame(maxWidth: .infinity, maxHeight: 90.0)
                            .frame(height: 40.0)
                            .background(Color(hue: 0.58, saturation: 0.032, brightness: 0.847))
                            .padding(10)
                        }
                        
                        Group {
                            Text("Workout 3:  \(selectedWorkout3)")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .padding(.leading)
                                .font(.title)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, maxHeight: 90.0)
                                .frame(height: 50.0)
                                .background(Color(hue: 0.58, saturation: 0.939, brightness: 0.687))
                                .padding(10)
                                .padding(.bottom,0)
                            
                            
                            Picker("Select the third workout", selection: $selectedWorkout3) {
                                ForEach(workoutsOption, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(.menu)
                            .padding(.leading)
                            .font(.title)
                            .frame(maxWidth: .infinity, maxHeight: 90.0)
                            .frame(height: 40.0)
                            .background(Color(hue: 0.58, saturation: 0.032, brightness: 0.847))
                            .padding(10)
                        }
                        
                        Group {
                            Text("Workout 4:  \(selectedWorkout4)")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .padding(.leading)
                                .font(.title)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, maxHeight: 90.0)
                                .frame(height: 50.0)
                                .background(Color(hue: 0.58, saturation: 0.939, brightness: 0.687))
                                .padding(10)
                                .padding(.bottom,0)
                            
                            
                            Picker("Select the fourth workout", selection: $selectedWorkout4) {
                                ForEach(workoutsOption, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(.menu)
                            .padding(.leading)
                            .font(.title)
                            .frame(maxWidth: .infinity, maxHeight: 90.0)
                            .frame(height: 40.0)
                            .background(Color(hue: 0.58, saturation: 0.032, brightness: 0.847))
                            .padding(10)
                        }
                        
                        Group {
                            Button (action:{
                                self.remindList.removeAll()
                                self.workoutList.removeAll()
                                self.remindList.append(WorkoutReminder(title: self.selectedWorkoutsDay))
                                self.workoutList.append(Workout(name: self.selectedWorkout1))
                                self.workoutList.append(Workout(name: self.selectedWorkout2))
                                self.workoutList.append(Workout(name: self.selectedWorkout3))
                                self.workoutList.append(Workout(name: self.selectedWorkout4))
                                let workout1 = WorkoutReminderData(remind:remindList,workout:workoutList,workoutRemindDate:dateCurrently2)
                                workout.workoutItem.append(workout1)
                                
                                self.showingAlert2 = true
                                
                            }){
                                
                                Text("Save")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .padding(.vertical)
                                    .frame(maxWidth: 200.0)
                                    .background(Color(hue: 0.58, saturation: 0.799, brightness: 0.91), in: Capsule())
                            }
                            .padding()
                            .alert(isPresented: $showingAlert2) {
                                Alert(title: Text("Data Has Been Saved!"),
                                      dismissButton: .default(Text("Ok"),action: {
//                                    isPresenting = true
                                    presentationMode.wrappedValue.dismiss()}))
                            }
//                            NavigationLink(destination: ContentView(), isActive: self.$isPresenting, label: {
//                                EmptyView()
//                               })
                        }
                        
                    }
                }
            }
        }
    }
    func removeItems(at offsets: IndexSet) {
        workout.workoutItem.remove(atOffsets: offsets)
        }
}




struct AddWorkout_Previews: PreviewProvider {
    static var previews: some View {
        AddWorkout( dateCurrently2: .constant(Date()))
    }
}
