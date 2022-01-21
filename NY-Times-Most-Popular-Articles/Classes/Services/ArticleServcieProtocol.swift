//
//  ArticleServcieProtocol.swift
//  NY-Times-Most-Popular-Articles
//
//  Created by Mouayyad Taja on 21/01/2022.
//

import Foundation

protocol ArticleServcieProtocol {
    func fetchArticles(_ completion: @escaping ((Result<ArticleCollection, Error>) -> Void))
}
