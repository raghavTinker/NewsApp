//
//  NewsManager.swift
//  NewsApp
//
//  Created by Raghav Sharma on 08/08/21.
//

import Foundation

class NewsManager: ObservableObject{
    
    @Published var news = [News]()
    func fetchNews(){
        var urlString: String
        if BasicUtilities.countries.contains(BasicUtilities.country){
            print("HERE")
            urlString = "https://newsapi.org/v2/top-headlines?country=\(BasicUtilities.country)&apiKey=3e9d63e1d45849cca4c583f2c9761045"
        }
        else{
            urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=3e9d63e1d45849cca4c583f2c9761045"
        }
        
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){ (data, response, error) in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do{
                            let results = try decoder.decode(NewsData.self, from: safeData)
                            DispatchQueue.main.async {
                                self.news = results.articles
                            }
                        }
                        catch{
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
