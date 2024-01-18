//
//  SuccessScreen.swift
//  NextGenLessons
//
//  Created by Kirill Lukyanov on 10.11.2023.
//

import SwiftUI
import WebKit


struct YoutubeVideoView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> WKWebView  {
        WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
        let path = "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
        guard let url = URL(string: path) else { return }
        
        uiView.scrollView.isScrollEnabled = false
        uiView.load(.init(url: url))
    }
}

struct SuccessScreen: View {
    var body: some View {
        YoutubeVideoView()
    }
}

struct SuccessScreen_Previews: PreviewProvider {
    static var previews: some View {
        SuccessScreen()
    }
}
