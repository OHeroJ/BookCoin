//
//  UserNotify.swift
//  App
//
//  Created by laijihua on 2018/8/27.
//
import Vapor
import FluentPostgreSQL

/// 遍历订阅(Subscription)表拉取公告(Announce)和提醒(Remind)的时候创建
/// 新建信息(Message)之后，立刻创建。
final class UserNotify: Content {
    var id: Int?
    var userId: User.ID
    var notifyId: Notify.ID
    var isRead: Bool

    var createdAt: Date?
    var updatedAt: Date?
    var deletedAt: Date?
    static var createdAtKey: TimestampKey? { return \.createdAt }
    static var updatedAtKey: TimestampKey? { return \.updatedAt }
    static var deletedAtKey: TimestampKey? { return \.deletedAt }

    init(userId: User.ID, notifyId: Notify.ID, isRead: Bool = false) {
        self.userId = userId
        self.notifyId = notifyId
        self.isRead = isRead
    }
}

extension UserNotify: Migration {}
extension UserNotify: PostgreSQLModel {}
