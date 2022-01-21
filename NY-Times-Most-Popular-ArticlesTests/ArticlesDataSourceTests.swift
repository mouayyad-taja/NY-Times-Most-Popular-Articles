//
//  ArticlesDataSourceTests.swift
//  NY-Times-Most-Popular-ArticlesTests
//
//  Created by Mouayyad Taja on 21/01/2022.
//

import XCTest
@testable import NY_Times_Most_Popular_Articles

class ArticlesDataSourceTests: XCTestCase {

    var dataSource : ArticlesDataSource!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        dataSource = ArticlesDataSource(onSelectItem: {_ in})
    }
    
    override func tearDownWithError() throws {
        dataSource = nil
        try super.tearDownWithError()
    }
    
    func testEmptyValueInDataSource() {
        
        // giving empty data value
        dataSource.data.value = []
        
        let tableView = UITableView()
        tableView.dataSource = dataSource
        
        // expected one section
        XCTAssertEqual(dataSource.numberOfSections(in: tableView), 1, "Expected one section in table view")
        
        // expected zero cells
        XCTAssertEqual(dataSource.tableView(tableView, numberOfRowsInSection: 0), 0, "Expected no cell in table view")
    }
    
    func testValueInDataSource() {

        // giving data value
        let article1 = Article()
        let article2 = Article()
        dataSource.data.value = [article1, article2]

        let tableView = UITableView()
        tableView.dataSource = dataSource

        // expected one section
        XCTAssertEqual(dataSource.numberOfSections(in: tableView), 1, "Expected one section in table view")

        // expected two cells
        XCTAssertEqual(dataSource.tableView(tableView, numberOfRowsInSection: 0), 2, "Expected two cell in table view")
    }
//
    func testValueCell() {

        // giving data value
        let dummyArticle = Article(title:"test title")
        dataSource.data.value = [dummyArticle]

        let tableView = UITableView()
        tableView.dataSource = dataSource
        tableView.register(nibWithCellClass: ArticleTVC.self)

        let indexPath = IndexPath(row: 0, section: 0)

        // expected ArticleTableViewCell class
        guard let _ = dataSource.tableView(tableView, cellForRowAt: indexPath) as? ArticleTVC else {
            XCTAssert(false, "Expected ArticleTableViewCell class")
            return
        }
    }

    

}
