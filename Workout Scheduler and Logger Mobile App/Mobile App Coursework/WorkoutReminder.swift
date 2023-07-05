//
//  Calendar.swift
//  Mobile App Coursework
//
//  Created by Omar Aratuc on 11/01/2023.
//

import SwiftUI

struct Workout: Identifiable, Codable {
        let name: String
        var id = UUID()
    }

struct WorkoutReminder: Identifiable, Codable {
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
}

struct WorkoutReminderData: Identifiable, Codable {
    var id = UUID().uuidString
    var remind: [WorkoutReminder]
    var workout: [Workout]
    var workoutRemindDate: Date
}

func getDate(offset: Int) -> Date {
    let calendar = Calendar.current

    let date = calendar.date(byAdding: .day, value: offset, to: Date())

    return date ?? Date()
}


