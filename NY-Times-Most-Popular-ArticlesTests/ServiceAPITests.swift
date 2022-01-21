//
//  ServiceAPITests.swift
//  NY-Times-Most-Popular-ArticlesTests
//
//  Created by Mouayyad Taja on 21/01/2022.
//

import XCTest
@testable import NY_Times_Most_Popular_Articles
@testable import Reachability

class ServiceAPITests: XCTestCase {
    
    var apiService : ArticleServcieProtocol!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
        apiService = ArticleServcie()
        
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        apiService = nil
        try super.tearDownWithError()
    }
    
    // Asynchronous test: success fast, failure slow
    func testFetchListArticles() throws {
        let reachability = try Reachability()

        try XCTSkipUnless(
            reachability.connection != .unavailable,
            "Network connectivity needed for this test."
        )
        
        
        let promise = expectation(description: "Status code: 200")
        var responseError :Error?
        
        
        // when
        apiService.fetchArticles{ result in
            //then
            switch result {
            case .success(let data):
                break
            case .failure(let error):
                responseError = error
            }
            promise.fulfill()
        }
        
        wait(for: [promise], timeout: 5)
        
        // then
        XCTAssertNil(responseError, "Expected fetch articles without retriving error")
    }
    
    
    func testCancelRequest() {
        guard let apiService = apiService as? ArticleServcie else {
            XCTAssert(false, "Expected failure when apiService is not ArticleServcie")
            return
        }
        // giving a "previous" session
        apiService.fetchArticles{ result in
            // ignore call
        }
        
        // Expected to task nil after cancel
        apiService.cancelFetchArticles()
        XCTAssertNil(apiService.request, "Expected request nil")
    }
    
}
