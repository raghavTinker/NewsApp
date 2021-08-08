//
//  WebView.swift
//  NewsApp
//
//  Created by Raghav Sharma on 08/08/21.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable{
    let news: News
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: news.url){
                let request = URLRequest(url: url)
                uiView.load(request)
        }
    }
}
