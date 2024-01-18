//
//  Udemy_Pt1.swift
//  NextGenLessons
//
//  Created by Kirill Lukyanov on 18.01.2024.
//

import SwiftUI


struct Udemy_Pt1: View {
    
    @State var date: Date  = .now
    
    var body: some View {
        VStack(spacing: 40) {
            Widget(date: $date)
            DatePicker("Select", selection: $date)
        }
        .padding(.horizontal, 50)
    }
}

struct Widget: View {
   
    @Binding var date: Date
    
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                Text(dayOfWeek())
                    .foregroundColor(Color(red: 182 / 255, green: 17 / 255, blue: 0 / 255))
                    .fontWeight(.bold)
                    .font(.footnote)
                Text(day())
                    .font(.title)
                    .foregroundColor(.white)
                VStack {
                    Image(systemName: "swift")
                        .foregroundColor(.white)
                        .padding(.bottom, 8)
                    Text("Learning")
                        .foregroundColor(.white)
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                    Text("Classroom \n \(time())")
                        .foregroundColor(.white)
                        .font(.system(size: 12))
                        .multilineTextAlignment(.center)
                }
                .frame(width: 90, height: 100)
                .background(
                    Gradient(colors: [Color(red: 1 / 255, green: 150 / 255, blue: 220 / 255)])
                )
                .cornerRadius(10)
            }
            .frame(width: 130, height: 230)
            .background(
                Gradient(colors: [Color(red: 1 / 255, green: 5 / 255, blue: 5 / 255), .blue])
            )
            .cornerRadius(15)
        }
        .padding(.horizontal, 50)
    }
    
    private func dayOfWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: date).capitalized
    }
    
    private func day() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        return dateFormatter.string(from: date)
    }
    
    private func time() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH mm"
        let firstHour = dateFormatter.string(from: date)
        let secondHour = dateFormatter.string(from: date.addingTimeInterval(60 * 60))
        return "\(firstHour) - \(secondHour)"
    }
}

struct Udemy_Pt1Preview: PreviewProvider {
    static var previews: some View {
        Udemy_Pt1()
    }
}
