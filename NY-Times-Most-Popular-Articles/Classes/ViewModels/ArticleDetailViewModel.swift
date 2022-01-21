//
//  ArticleDetailViewModel.swift
//  NY-Times-Most-Popular-Articles
//
//  Created by Mouayyad Taja on 21/01/2022.
//

import Foundation

class ArticleDetailViewModel {
        
    //stories dataSource
    private(set) var item : DynamicValue<Article?> = DynamicValue<Article?>(nil)
        
    //MARK: Initialization
    init(article: Article) {
        self.item.value = article
    }
}

