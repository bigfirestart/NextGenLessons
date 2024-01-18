//
//  ContentView.swift
//  NextGenLessons
//
//  Created by Kirill Lukyanov on 11.10.2023.
//

import SwiftUI

enum Lesson: String, CaseIterable {
    
    case les1 = "1. Картинки и отсутупы"
    case les2 = "2. State + Базовые компоненты"
    case les3 = "3. Фибоначи"
    case les4 = "4. Forms"
    
    case combineLes1 = "1. Basics + MVVM"
    
    case udemyLes1 = "Udemy pt 1"
}

struct MainView: View {
    
    @State var yotubeLessons: [Lesson] = Array(Lesson.allCases[0...3])
    @State var combineLessons: [Lesson] = Array(arrayLiteral: Lesson.allCases[4])
    @State var udemyLessons: [Lesson] = Array(Lesson.allCases[5...])
    
    @ViewBuilder
    func navigate(to screen: Lesson) -> some View {
        switch screen {
        case .les1: Les1()
        case .les2: Les2()
        case .les3: Les3()
        case .les4: Les4()
        case .combineLes1: Combine_Les1()
        case .udemyLes1: Udemy_Pt1()
        }
    }

    @State var isNavHidden = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                List {
                    Section("YouTube") {
                        ForEach(yotubeLessons, id: \.self) {
                            NavigationLink(
                                $0.rawValue,
                                destination: navigate(to: $0)
                            )
                        }
                    }
                    Section("Combine") {
                        ForEach(combineLessons, id: \.self) {
                            NavigationLink(
                                $0.rawValue,
                                destination: navigate(to: $0)
                            )
                        }
                    }
                    Section("Udemy") {
                        ForEach(udemyLessons, id: \.self) {
                            NavigationLink(
                                $0.rawValue,
                                destination: navigate(to: $0)
                            )
                        }
                    }
                }
            }
            .navigationTitle("Уроки SwiftUI")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
