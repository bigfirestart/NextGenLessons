//
//  Les2.swift
//  NextGenLessons
//
//  Created by Kirill Lukyanov on 16.10.2023.
//

import SwiftUI

struct Les2: View {
    
    @State private var toggle: Bool = true
    @State private var i: Int = 1
    @State private var buttonText: String = "Increase"
    
    enum RGB: String, Equatable, CaseIterable {
        case red
        case green
        case blue
    }
    
    @State private var currentRGBState: RGB = .red
    @State private var buttonColorRed: Double = 100
    @State private var buttonColorGreen: Double = 100
    @State private var buttonColorBlue: Double = 100
    
    var body: some View {
        VStack(spacing: 50) {
            Toggle(isOn: $toggle) {
                Text("isShowen")
            }
            .padding(.horizontal, 100)
            
            if toggle {
                Text(String(i))
                    .font(.largeTitle)
                
                Button(buttonText) {
                    i += 1
                }
                    .buttonStyle(.borderedProminent)
                    .font(.largeTitle)
                    .tint(
                        Color(
                            red: buttonColorRed / 255,
                            green: buttonColorGreen / 255,
                            blue: buttonColorBlue / 255
                        )
                    )
                
                TextField("Button Text", text: $buttonText)
                    .textFieldStyle(.roundedBorder)
                
                SecureField("Button Secure", text: $buttonText)
                    .textFieldStyle(.roundedBorder)
                
                Picker("R/G/B", selection: $currentRGBState) {
                    ForEach(RGB.allCases, id: \.self) { value in
                        Text(value.rawValue).tag(value)
                    }
                }
                    .pickerStyle(.wheel)
                
                Slider(
                    value: {
                        switch currentRGBState {
                        case .red:
                            return $buttonColorRed
                        case .green:
                            return $buttonColorGreen
                        case .blue:
                            return $buttonColorBlue
                        }
                    }(),
                    in: 1...255
                )
            }
        }
        .padding(.horizontal, 20)
    }
}

struct Les2_Previews: PreviewProvider {
    static var previews: some View {
        Les2()
    }
}
