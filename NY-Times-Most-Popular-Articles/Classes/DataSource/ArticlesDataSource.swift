//
//  ArticlesDataSource.swift
//  NY-Times-Most-Popular-Articles
//
//  Created by Mouayyad Taja on 21/01/2022.
//

import Foundation
import SwifterSwift

public typealias CompletionHandler<T> = (T)->Void

class ArticlesDataSource: GenericDataSource<Article>, UITableViewDelegate, UITableViewDataSource {
    
    //closure selecting item
    var onSelectItem: CompletionHandler<Article>?
    
    //MARK: Initialization
    init(onSelectItem: CompletionHandler<Article>?) {
        super.init()
        self.onSelectItem = onSelectItem
    
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: ArticleTVC.self, for: indexPath)
        let item = self.data.value[indexPath.row]
        cell.configCellUI()
        cell.article = item
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
            let item = self.data.value[indexPath.row]
        self.onSelectItem?(item)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

