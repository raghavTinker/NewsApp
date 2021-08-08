//
//  ContentView.swift
//  NewsApp
//
//  Created by Raghav Sharma on 07/08/21.
//
import SwiftUI

struct ContentView: View {
    @ObservedObject private var locationManager = LocationManager()
    @ObservedObject var newsManager = NewsManager()
    var body: some View {
        NavigationView{
            List(newsManager.news){ news in
                NavigationLink(
                    destination: DetailView(newsObject: news),
                    label: {
                        Text(news.title)
                    })
            }
            .navigationTitle("Top News in \(BasicUtilities.country_name)")
        }
        .onReceive(locationManager.$country){
            if $0 != nil{
                self.newsManager.fetchNews()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

