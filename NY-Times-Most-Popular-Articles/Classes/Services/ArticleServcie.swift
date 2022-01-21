//
//  ArticleServcie.swift
//  NY-Times-Most-Popular-Articles
//
//  Created by Mouayyad Taja on 21/01/2022.
//

import Foundation
import Alamofire
import Reachability


final class ArticleServcie : ArticleServcieProtocol {
        
    let service = APIServie()
    
    // API URLS
    let APIKey = Constants.APIKey
    let kAPIPeriods:Int = 7
    let kAPISections = "all-sections"
    let API_BASE_URL: String = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/"
    
    var request : DataRequest?
    
    //Get articles
    func fetchArticles(_ completion: @escaping ((Result<ArticleCollection, Error>) -> Void)){
        
        let NEWS_API_URL = API_BASE_URL + "/\(kAPISections)" + "/\(kAPIPeriods)" + ".json?api-key=\(APIKey)"
        
        // cancel previous request if already in progress
        self.cancelFetchArticles()
        
        self.request = AF.request(NEWS_API_URL, method: .get, parameters: [:])
        
        do {
            let reachability = try Reachability()
            if reachability.connection == .unavailable {
                let error = NSError.networkError
                completion(.failure(error))
                return
            }
        }
        catch(let error){
            print(error)
        }
        
        request?.responseDecodable(of: ArticleCollection.self){ (response) in
            self.service.handleResponse(response: response, { result in
                switch result {
                case .success(let data):
                    completion(Result.success(data))
                case .failure(let error):
                    completion(Result.failure(error))
                    return
                }
            })
            
        }
    }
    
    func cancelFetchArticles() {
        if let task = request {
            task.cancel()
        }
        request = nil
    }
    
}
