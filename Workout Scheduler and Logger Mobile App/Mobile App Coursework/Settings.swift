//
//  Settings.swift
//  Mobile App Coursework
//
//  Created by Omar Aratuc on 15/12/2022.
//

import SwiftUI

struct Settings: View {
    @AppStorage("isDarkMode") private var isDarkMode = false

    var body: some View {
        VStack(spacing:0) {
            Spacer()
                .frame(height:1)
            Text("Workout Planner")
                .foregroundColor(.white)
                .font(.largeTitle)
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: 120.0)
                .background(Color(hue: 0.58, saturation: 0.799, brightness: 0.91))
            
            Text("Settings")
                .foregroundColor(.white)
                .font(.title)
                .frame(maxWidth: .infinity, maxHeight: 65.0)
                    .border(Color.black)
                    .background(Color(hue: 0.58, saturation: 0.029, brightness: 0.575))
                    .padding(.all,1)
            
            Toggle("Dark Mode", isOn: $isDarkMode)
                .foregroundColor(.black)
                .font(.title)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 65.0)
                    .border(Color.black)
                    .background(Color(hue: 0.58, saturation: 0.009, brightness: 0.833))
                    .padding(.all,15)
            Spacer()
            }
        }
    }


struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
