//
//  GenericDataSource.swift
//  NY-Times-Most-Popular-Articles
//
//  Created by Mouayyad Taja on 21/01/2022.
//

import Foundation
class GenericDataSource<T>: NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}
