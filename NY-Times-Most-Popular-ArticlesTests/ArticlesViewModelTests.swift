//
//  ArticlesViewModelTests.swift
//  NY-Times-Most-Popular-ArticlesTests
//
//  Created by Mouayyad Taja on 21/01/2022.
//

import XCTest
@testable import NY_Times_Most_Popular_Articles

class ArticlesViewModelTests: XCTestCase {

    var viewModel : ArticlesViewModel!
    var dataSource : GenericDataSource<Article>!
    fileprivate var service : MockService!
    var viewModelWithArticles : ArticlesViewModel!
    fileprivate var serviceWithArticle : MockServiceWithArticle!

    
    override func setUp() {
        super.setUp()
        self.service = MockService()
        self.serviceWithArticle = MockServiceWithArticle()
        self.dataSource = GenericDataSource<Article>()
        self.viewModel = ArticlesViewModel(dataSource: dataSource, apiService: service)
        self.viewModelWithArticles = ArticlesViewModel(dataSource: dataSource, apiService: serviceWithArticle)
    }
    
    override func tearDown() {
        self.viewModel = nil
        self.dataSource = nil
        self.service = nil
        super.tearDown()
    }
    
    func testFetchWithNoService() {
        
        // giving no service to a view model
        self.viewModel = ArticlesViewModel(dataSource: dataSource, apiService: nil)

        // expected to not be able to fetch article
        viewModel.getArticles{ result in
            switch result {
            case .success(_) :
                XCTAssert(false, "ViewModel should not be able to fetch without service")
            default:
                break
            }
        }
    }

    
    func testFetchArticles() {
        // expected completion to succeed
        
        viewModelWithArticles.getArticles { result in
            switch result {
            case .failure(_) :
                XCTAssert(false, "ViewModel should not be able to fetch without service")
            default:
                break
            }
        }
    }
    
    func testFetchNoArticles() {

        // expected completion to fail
        viewModel.getArticles { result in
            switch result {
            case .success(_) :
                XCTAssert(false, "ViewModel should not be able to fetch ")
            default:
                break
            }
        }
    }
    
    fileprivate class MockService : ArticleServcieProtocol {
        var ariclesData: ArticleCollection?
        
        func fetchArticles(_ completion: @escaping ((Result<ArticleCollection, Error>) -> Void)) {
            if let ariclesData = ariclesData {
                completion(Result.success(ariclesData))
            } else {
                let error = NSError(domain: "", code: -1, userInfo: [ NSLocalizedDescriptionKey: "No ariclesData"])
                completion(Result.failure(error))
            }
        }
    }

    fileprivate class MockServiceWithArticle : ArticleServcieProtocol {
        var ariclesData: ArticleCollection? = ArticleCollection(results: [Article(title: "fake title")])
        
        func fetchArticles(_ completion: @escaping ((Result<ArticleCollection, Error>) -> Void)) {
            if let ariclesData = ariclesData {
                completion(Result.success(ariclesData))
            } else {
                let error = NSError(domain: "", code: -1, userInfo: [ NSLocalizedDescriptionKey: "No ariclesData"])
                completion(Result.failure(error))
            }
        }
    }

    
}
