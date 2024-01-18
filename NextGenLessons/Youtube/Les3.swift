//
//  Les3.swift
//  NextGenLessons
//
//  Created by Kirill Lukyanov on 26.10.2023.
//

import Foundation

import SwiftUI

struct Les3: View {
    
    @State private var fibs = [1, 1]
    @State private var isError: Bool = false
    
    var body: some View {
        VStack {
            List {
                Stepper("Fibonachi") {
                    fibs.append(fibs[fibs.count - 1] + fibs[fibs.count - 2])
                } onDecrement: {
                    guard fibs.count > 2 else { return }
                    fibs.remove(at: fibs.count - 1)
                }
                
                ForEach(fibs, id: \.self) {
                    Text("\($0)")
                }
            }
        }
    }
}

struct Les3_Previews: PreviewProvider {
    static var previews: some View {
        Les3()
    }
}
