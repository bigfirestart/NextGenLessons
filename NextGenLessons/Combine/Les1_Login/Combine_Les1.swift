//
//  Combine_Les1.swift
//  NextGenLessons
//
//  Created by Kirill Lukyanov on 10.11.2023.
//

import SwiftUI

struct Combine_Les1: View {
    
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack {
            Color("darkBg1").ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                
                Image("boy")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(
                        width: screenWidth / 1.25,
                        height: screenWidth / 1.25
                    )
                
                Text("Authorization")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                
                LoginForm()
                    .padding(.horizontal, 30)
            }
        }
        .frame(height: UIScreen.main.bounds.height - 10)
    }
}

struct Combine_Les1_Previews: PreviewProvider {
    static var previews: some View {
        Combine_Les1()
    }
}


struct LoginForm: View {
    
    @StateObject var viewModel = LoginViewModel()
    @State var pushRickRoll = false
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            CustomTextField(
                title: "Email",
                text: $viewModel.email,
                prompt: viewModel.emailPrompt
            )
            
            CustomTextField(
                title: "Phone",
                text: $viewModel.phone,
                prompt: viewModel.phonePrompt
            )
                .onChange(of: viewModel.phone) { _ in
                    DispatchQueue.main.async {
                        viewModel.phone = viewModel.phone.formattedMask(
                            text: viewModel.phone,
                            mask: "+X (XXX) XXX-XX-XX"
                        )
                    }
                }
                .keyboardType(.numberPad)
            
                
            CustomTextField(
                title: "Password",
                text: $viewModel.password,
                prompt: viewModel.passwordPrompt,
                isSecure: true
            )
            
            Spacer()
                .frame(height: 10)
            

            Button {
                pushRickRoll = true
            } label: {
                ZStack  {
                    if viewModel.canSubmit {
                        AnimatedGradient(colors: [.purple, .cyan])
                    } else {
                        Rectangle()
                            .foregroundColor(.gray)
                    }
                    Text("Login")
                        .foregroundColor(.white)
                        .font(.title3)
                        .fontWeight(.bold)
                }
                .frame(height: 45)
                .cornerRadius(10)
            }
            .disabled(!viewModel.canSubmit)
            
            NavigationLink(
                "",
                destination: SuccessScreen(),
                isActive: $pushRickRoll
            )
        }
            
    }
}
