//
//  ContentView.swift
//  NewsApp
//
//  Created by Raghav Sharma on 07/08/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var body: some View {
        NavigationView{
            List(topics){ topic in
                Text(topic.title)
            }
            .navigationBarTitle("News")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Topic: Identifiable{
    let id: String
    let title: String
}

let topics = [
                Topic(id: "1", title: "Microsoft"),
                Topic(id: "2", title: "Apple"),
                Topic(id: "3", title: "Tesla")
            ]
    
