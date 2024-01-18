//
//  ViewModel.swift
//  NextGenLessons
//
//  Created by Kirill Lukyanov on 10.11.2023.
//

import Foundation
import Combine

enum Regex: String {
    case phone = "(\\s*)?(\\+)?([- _():=+]?\\d[- _():=+]?){10,14}(\\s*)?"
    case email =  "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
}

final class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var phone: String = ""
    @Published var password: String = ""
    
    @Published var canSubmit: Bool = false
    
    @Published private var isValidEmail: Bool = false
    @Published private var isValidPhone: Bool = false
    @Published private var isValidPassword: Bool = false
    
    var emailPrompt: String? {
        if isValidEmail == true || email.isEmpty {
            return nil
        } else {
            return "Enter valid Email. Example: test@test.com"
        }
    }

    var phonePrompt: String? {
        if isValidPhone == true || phone.isEmpty {
            return nil
        } else {
            return "Enter full phone number"
        }
    }
    
    var passwordPrompt: String? {
        if isValidPassword == true || password.isEmpty {
            return nil
        } else {
            return "Password - requerid field"
        }
    }
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    private let emailPredicate = NSPredicate(format: "SELF MATCHES %@", Regex.email.rawValue)
    private let phonePredicate = NSPredicate(format: "SELF MATCHES %@", Regex.phone.rawValue)
    
    init() {
        $email
            .map {
                self.emailPredicate.evaluate(with: $0)
            }
            .assign(to: \.isValidEmail, on: self)
            .store(in: &cancellableSet)
        
        $phone
            .map {
                self.phonePredicate.evaluate(with: $0)
            }
            .assign(to: \.isValidPhone, on: self)
            .store(in: &cancellableSet)
        
        $password
            .map {
                $0.count >= 8
            }
            .assign(to: \.isValidPassword, on: self)
            .store(in: &cancellableSet)
        
        Publishers.CombineLatest3($isValidEmail, $isValidPhone, $isValidPassword)
            .map { email, phone, password in
                return (email && phone && password)
            }
            .assign(to: \.canSubmit, on: self)
            .store(in: &cancellableSet)
    }
}

extension String {
    func formattedMask(text: String, mask: String?) -> String {
        let cleanPhoneNumber = text.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        var result = ""
        var index = cleanPhoneNumber.startIndex
        if let mask = mask {
            for ch in mask where index < cleanPhoneNumber.endIndex {
                if ch == "X" {
                    result.append(cleanPhoneNumber[index])
                    index = cleanPhoneNumber.index(after: index)
                } else {
                    result.append(ch)
                }
            }
        }
        return result
    }
}
