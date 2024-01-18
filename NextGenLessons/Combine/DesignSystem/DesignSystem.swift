//
//  DesignSystem.swift
//  NextGenLessons
//
//  Created by Kirill Lukyanov on 10.11.2023.
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
      return configuration
            .textFieldStyle(.plain)
            .padding(.horizontal, 8)
            .frame(height: 45)
            .cornerRadius(10)
            .foregroundColor(.white)
            .accentColor(.pink)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
    }
}

import SwiftUI

struct CustomTextField: View {
    
    private var title: String
    private var text: Binding<String>
    private var prompt: String?
    private var isSecure: Bool
    
    init(title: String, text: Binding<String>, prompt: String? = nil, isSecure: Bool = false) {
        self.title = title
        self.text = text
        self.prompt = prompt
        self.isSecure = isSecure
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            if isSecure {
                SecureField(title, text: text)
                    .textFieldStyle(CustomTextFieldStyle())
                    .background(prompt == nil ? Color.white.opacity(0.1) : Color.red.opacity(0.15))
                    .cornerRadius(10)
            } else  {
                TextField(title, text: text)
                    .textFieldStyle(CustomTextFieldStyle())
                    .background(prompt == nil ? Color.white.opacity(0.1) : Color.red.opacity(0.15))
                    .cornerRadius(10)
            }
            
            if let prompt = prompt {
                Text(prompt)
                    .foregroundColor(.red)
                    .font(.caption)
                    .padding(.horizontal)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct AnimatedGradient: View {
    
    @State private var start = UnitPoint(x: 0, y: 0)
    @State private var end = UnitPoint(x: 0, y: 2)
    
    let colors: [Color]
    
    var body: some View {
        LinearGradient(colors: colors, startPoint: start, endPoint: end)
            .onAppear {
                withAnimation (.easeInOut(duration: 3).repeatForever()) {
                    self.start = UnitPoint(x: 1, y: -1)
                    self.end = UnitPoint(x: 0, y: 1)
                }
            }
    }
}
