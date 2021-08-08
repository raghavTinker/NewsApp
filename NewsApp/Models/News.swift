import Foundation


struct NewsData: Decodable{
    let articles: [News]
}

struct News: Decodable, Identifiable{
    let publishedAt: String
    let title: String
    let url: String
    
    var id: String{
        return publishedAt
    }
}
