//
//  ExerciseView.swift
//  Mobile App Coursework
//
//  Created by Omar Aratuc on 15/12/2022.
//

import SwiftUI


struct ExerciseView: View {
    @State private var dumbbellCurl: String = ""
    @State private var deadlift: String = ""
    @State private var barbellSquat: String = ""
    @State private var benchPress: String = ""
    @State private var lateralRaise: String = ""
    @State private var dumbbellPress: String = ""
    @State private var tricepsExt: String = ""
    @State private var save = ""
    @State private var showingAlert = false
    
    init() {
            let dumbbellCurl = UserDefaults.standard.string(forKey: "Dumbbell Curl") ?? ""
            let deadlift = UserDefaults.standard.string(forKey: "Deadlift") ?? ""
            let barbellSquat = UserDefaults.standard.string(forKey: "Barbell Squat") ?? ""
            let benchPress = UserDefaults.standard.string(forKey: "Bench Press") ?? ""
            let lateralRaise = UserDefaults.standard.string(forKey: "Lateral Raise") ?? ""
            let dumbbellPress = UserDefaults.standard.string(forKey: "Dumbbell Press") ?? ""
            let tricepsExt = UserDefaults.standard.string(forKey: "Triceps Ext") ?? ""
            self._dumbbellCurl = State(initialValue: dumbbellCurl)
            self._deadlift = State(initialValue: deadlift)
            self._barbellSquat = State(initialValue: barbellSquat)
            self._benchPress = State(initialValue: benchPress)
            self._lateralRaise = State(initialValue: lateralRaise)
            self._dumbbellPress = State(initialValue: dumbbellPress)
            self._tricepsExt = State(initialValue: tricepsExt)
        }
    var body: some View {
        NavigationView {
            VStack(spacing:0) {
                Spacer()
                    .frame(height:1)
                Text("Workout Planner")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .ignoresSafeArea()
                    .frame(maxWidth: .infinity, maxHeight: 120.0)
                    .background(Color(hue: 0.58, saturation: 0.799, brightness: 0.91))
                Text("Exercise Tracker")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .ignoresSafeArea()
                    .frame(maxWidth: .infinity, maxHeight: 85.0)
                    .background(Color(hue: 0.58, saturation: 0.968, brightness: 0.611))
                
                Spacer()
                    .frame(height:30)
                
                VStack {
                    HStack(spacing:0) {
                        Text("Exercise")
                            .foregroundColor(.white)
                            .font(.system(size: 35.0))
                            .ignoresSafeArea()
                            .frame(maxWidth: .infinity, maxHeight: 60.0)
                            .border(Color.black)
                            .background(Color(hue: 0.58, saturation: 0.968, brightness: 0.611))
                        
                        Text("Weight (kg)")
                            .foregroundColor(.white)
                            .font(.system(size: 35.0))
                            .ignoresSafeArea()
                            .frame(maxWidth: .infinity, maxHeight: 60.0)
                            .border(Color.black)
                            .background(Color(hue: 0.576, saturation: 0.968, brightness: 0.611))
                    }
                    
                    ScrollView {
                        HStack {
                            Text("Dumbbell Curl:")
                                .font(.system(size: 20.0, weight: .heavy, design: .default))
                                .padding(.all,20)
                            Spacer()
                            
                            TextField("Dumbbell Curl",text: $dumbbellCurl) {
                            }
                            .frame(width:120,height: 55)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 4)
                            .cornerRadius(16)
                            .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
                            .padding([.horizontal], 24)
                            .multilineTextAlignment(.center)
                            .keyboardType(.numberPad)
                        }
                        
                        HStack {
                            Text("Deadlift:")
                                .font(.system(size: 20.0, weight: .heavy, design: .default))
                                .padding(.all,20)
                            Spacer()
                            
                            TextField("Deadlift",text: $deadlift) {
                            }
                            .frame(width:120,height: 55)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 4)
                            .cornerRadius(16)
                            .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
                            .padding([.horizontal], 24)
                            .multilineTextAlignment(.center)
                            .keyboardType(.numberPad)
                        }
                        
                        HStack {
                            Text("Barbell Squat:")
                                .font(.system(size: 20.0, weight: .heavy, design: .default))
                                .padding(.all,20)
                            Spacer()
                            
                            TextField("Barbell Squat", text: $barbellSquat) {
                            }
                            .frame(width:120,height: 55)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 4)
                            .cornerRadius(16)
                            .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
                            .padding([.horizontal], 24)
                            .multilineTextAlignment(.center)
                            .keyboardType(.numberPad)
                        }
                        
                        HStack {
                            Text("Bench Press:")
                                .font(.system(size: 20.0, weight: .heavy, design: .default))
                                .padding(.all,20)
                            Spacer()
                            
                            TextField("Bench Press",text: $benchPress) {
                            }
                            .frame(width:120,height: 55)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 4)
                            .cornerRadius(16)
                            .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
                            .padding([.horizontal], 24)
                            .multilineTextAlignment(.center)
                            .keyboardType(.numberPad)
                        }
                        
                        HStack {
                            Text("Lateral Raise:")
                                .font(.system(size: 20.0, weight: .heavy, design: .default))
                                .padding(.all,20)
                            Spacer()
                            
                            TextField("Lateral Raise", text: $lateralRaise) {
                            }
                            .frame(width:120,height: 55)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 4)
                            .cornerRadius(16)
                            .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
                            .padding([.horizontal], 24)
                            .multilineTextAlignment(.center)
                            .keyboardType(.numberPad)
                        }
                        
                        HStack {
                            Text("Dumbbell Press:")
                                .font(.system(size: 20.0, weight: .heavy, design: .default))
                                .padding(.all,20)
                            Spacer()
                            
                            TextField("Dumbbell Press", text: $dumbbellPress) {
                            }
                            .frame(width:120,height: 55)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 4)
                            .cornerRadius(16)
                            .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
                            .padding([.horizontal], 24)
                            .multilineTextAlignment(.center)
                            .keyboardType(.numberPad)
                        }
                        
                        HStack {
                            Text("Triceps Ext.:")
                                .font(.system(size: 20.0, weight: .heavy, design: .default))
                                .padding(.all,20)
                            Spacer()
                            
                            TextField("Triceps Ext", text: $tricepsExt) {
                            }
                            .frame(width:120,height: 55)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 4)
                            .cornerRadius(16)
                            .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
                            .padding([.horizontal], 24)
                            .multilineTextAlignment(.center)
                            .keyboardType(.numberPad)
                        }
                        Button (action:
                                    {
                            UserDefaults.standard.setValue(self.dumbbellCurl, forKey: "Dumbbell Curl" )
                            UserDefaults.standard.setValue(self.deadlift, forKey: "Deadlift" )
                            UserDefaults.standard.setValue(self.barbellSquat, forKey: "Barbell Squat")
                            UserDefaults.standard.setValue(self.benchPress, forKey: "Bench Press" )
                            UserDefaults.standard.setValue(self.lateralRaise, forKey: "Lateral Raise" )
                            UserDefaults.standard.setValue(self.dumbbellPress, forKey: "Dumbbell Press" )
                            UserDefaults.standard.setValue(self.tricepsExt, forKey: "Triceps Ext" )
                            self.showingAlert = true
                        }){
                            Text("Save")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .padding(.vertical)
                                .frame(maxWidth: 200.0)
                                .background(Color(hue: 0.58, saturation: 0.799, brightness: 0.91), in: Capsule())
                        }
                        .padding()
                        .alert(isPresented: $showingAlert) {
                            Alert(title: Text("Data Has Been Saved!"),
                                  dismissButton: .default(Text("Ok")))
                            
                            
                        }
                    }
                    
                }
            }
        }
    }
}


struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView()
    }
}
