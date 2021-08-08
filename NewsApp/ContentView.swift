//
//  ContentView.swift
//  NewsApp
//
//  Created by Raghav Sharma on 07/08/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var locationManager = LocationManager()
    var body: some View {
        if let country_code = locationManager.country{
            Text("\(country_code)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
