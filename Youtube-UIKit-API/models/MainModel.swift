//
//  Main.swift
//  Youtube-UIKit-API
//
//  Created by ozy on 22.08.2021.
//

import Foundation

struct MainModel: Decodable {
    var type: MainTypes
    var description: String?
    var channel: String?
    var views: Float?
    var timestamp: String?
    var preiewImage: String?
    var duration: String?
}

enum MainTypes: String, Decodable {
    case video, story, news
}
