//
//  Workouts.swift
//  Mobile App Coursework
//
//  Created by Latitude on 26/01/2023.
//

import Foundation


class Workouts: ObservableObject {
    
    @Published var workoutItem = [WorkoutReminderData]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(workoutItem) {
                UserDefaults.standard.set(encoded, forKey: "Reminders")
            }
        }
    }
    
    init() {
        if let savedWorkouts = UserDefaults.standard.data(forKey: "Reminders") {
            if let decodedWorkouts = try? JSONDecoder().decode([WorkoutReminderData].self, from: savedWorkouts) {
                workoutItem = decodedWorkouts
                return
            }
        }
        
        workoutItem = [WorkoutReminderData(remind: [
            WorkoutReminder(title: "Leg Day")], workout: [Workout(name:"Barbell Squat"),Workout(name:"Deadlift"),Workout(name:"Leg Extension"),Workout(name:"Lunges")], workoutRemindDate: getDate(offset: -15)),

        WorkoutReminderData(remind: [
            WorkoutReminder(title: "Arm Day")], workout: [Workout(name:"Dumbbell Curl"),Workout(name:"Bar Curl"),Workout(name:"Incline Bicep Curl"),Workout(name:"Chin Up")], workoutRemindDate: getDate(offset: 4)),

        WorkoutReminderData(remind: [
            WorkoutReminder(title: "Chest Day")], workout: [Workout(name:"Bench Press"),Workout(name:"Push Up"),Workout(name:"Machine Chest Press"),Workout(name:"Chest Fly")], workoutRemindDate: getDate(offset: 7)),

        WorkoutReminderData(remind: [
            WorkoutReminder(title: "Back Day")], workout: [Workout(name:"T-Bar Row"),Workout(name:"Pull Up"),Workout(name:"Lat Pull Down"),Workout(name:"Decline Press")], workoutRemindDate: getDate(offset: 8)),

        WorkoutReminderData(remind: [
            WorkoutReminder(title: "Shoulder Day")], workout: [Workout(name:"Bench Press"),Workout(name:"Push Up"),Workout(name:"Lateral Raise")], workoutRemindDate: getDate(offset: 9)),

        WorkoutReminderData(remind: [
            WorkoutReminder(title: "Leg Day")], workout: [Workout(name:"Barbell Squat"),Workout(name:"Deadlift"),Workout(name:"Leg Extension"),Workout(name:"Lunges")], workoutRemindDate: getDate(offset: 10))]
    }
}





