//
//  Article.swift
//  NY-Times-Most-Popular-Articles
//
//  Created by Mouayyad Taja on 21/01/2022.
//

import Foundation

// MARK: - Article
struct Article: Codable {
    var uri: String?
    var url: String?
    var id, assetID: Int?
    var source, publishedDate, updated, section: String?
    var subsection, nytdsection, adxKeywords, byline: String?
    var type, title, abstract: String?
    var desFacet: [String]?
    var media: [Media]?
    var etaID: Int?

    enum CodingKeys: String, CodingKey {
        case uri, url, id
        case assetID = "asset_id"
        case source
        case publishedDate = "published_date"
        case updated, section, subsection, nytdsection
        case adxKeywords = "adx_keywords"
        case byline, type, title, abstract
        case desFacet = "des_facet"
        case media
        case etaID = "eta_id"
    }
    
    var imageUrl: String?{
        return self.media?.first?.mediaMetadata?.first?.url ?? nil
    }
    
    var largeImageUrl: String?{
        if let meta = self.media?.first?.mediaMetadata?.first(where: { meta in
            return (meta.height ?? 0) > 150
        }){
            return meta.url ?? nil
        }
        return imageUrl
    }
}
