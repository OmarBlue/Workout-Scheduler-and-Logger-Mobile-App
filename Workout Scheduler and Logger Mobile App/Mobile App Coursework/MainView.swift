//
//  MainView.swift
//  Mobile App Coursework
//
//  Created by Omar Aratuc on 15/12/2022.
//

import SwiftUI

struct MainView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    var body: some View {
        NavigationView {
            TabView {
                ContentView()
                    .tabItem {
                        Label("Calendar", systemImage: "calendar")
                    }
                    .preferredColorScheme(isDarkMode ? .dark : .light)
                
                ExerciseView()
                    .tabItem {
                        Label("Logger", systemImage: "menubar.dock.rectangle.badge.record")
                    }
                    .preferredColorScheme(isDarkMode ? .dark : .light)
                
                Settings()
                    .tabItem {
                        Label("Settings", systemImage: "gearshape")
                    }
                    .preferredColorScheme(isDarkMode ? .dark : .light)
                
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
