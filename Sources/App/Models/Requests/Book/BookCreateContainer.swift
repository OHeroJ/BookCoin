//
//  BookCreateContainer.swift
//  App
//
//  Created by laijihua on 2018/6/27.
//

import Vapor

struct BookCreateContainer: Content {
    var isbn: String
    var name: String
    var author: String
    var price: Double
    var detail: String
    var convers: [String]
    var doubanPrice: Double // 豆瓣价格
    var doubanGrade: Double // 豆瓣等级
    var classifyId: BookClassify.ID
    var priceUintId: PriceUnit.ID
}

struct BookUpdateContainer: Content {
    var id: Book.ID
    var price: Double?
    var detail: String?
    var convers: [String]?
}

struct BookCheckContainer: Content {
    var id: Book.ID
    var state: Book.State
    var remarks: String // 审核的标注
}
