//
//  Les1.swift
//  NextGenLessons
//
//  Created by Kirill Lukyanov on 16.10.2023.
//

import SwiftUI

struct Les1: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "heart.fill")
                    .imageScale(.small)
                Text("Small")
            }
            HStack {
                Image(systemName: "heart.fill")
                    .imageScale(.medium)
                Text("Medium")
            }

            HStack {
                Image(systemName: "heart.fill")
                    .imageScale(.large)
                Text("Large")
            }
        }
    }
}

struct Les1Preview: PreviewProvider {
    static var previews: some View {
        Les1()
    }
}
