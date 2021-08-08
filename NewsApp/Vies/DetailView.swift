//
//  DetailView.swift
//  NewsApp
//
//  Created by Raghav Sharma on 08/08/21.
//

import Foundation

import SwiftUI
import WebKit

struct DetailView: View {
    let newsObject: News
    var body: some View {
        WebView(news: newsObject)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(newsObject: News(publishedAt: "2021", title: "Raghav is the CEO of Apple", url: "https://www.google.co.in"))
    }
}
