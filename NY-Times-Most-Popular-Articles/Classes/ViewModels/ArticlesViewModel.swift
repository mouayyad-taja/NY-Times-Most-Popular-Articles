//
//  ArticlesViewModel.swift
//  NY-Times-Most-Popular-Articles
//
//  Created by Mouayyad Taja on 21/01/2022.
//

import Foundation
import SwifterSwift
import Alamofire

class ArticlesViewModel {
    
    //Api reference
    private var apiService : ArticleServcieProtocol?
    
    //stories dataSource
    private(set) weak var dataSource : GenericDataSource<Article>?
    
    //Observable error
    private(set) var error : DynamicValue<Error?> = DynamicValue<Error?>(nil)
    
    //MARK: Initialization
    init(dataSource : GenericDataSource<Article>?, apiService: ArticleServcieProtocol? = ArticleServcie()) {
        self.dataSource = dataSource
        self.apiService = apiService
    }
    
    //Get list articles
    func getArticles(_ completion: ((Result<[Article], Error>)->Void)? = nil){
        self.apiService?.fetchArticles(){
            result in
            switch result {
            case .success(let item):
                let items = item.results ?? []
                //assign result
                self.dataSource?.data.value = items
                completion?(.success(items))
            case .failure(let error):
                print("error \(error)")
                self.error.value = error
                completion?(.failure(error))
            }
        }
    }
}

