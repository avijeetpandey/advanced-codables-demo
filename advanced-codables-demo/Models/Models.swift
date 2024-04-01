//
//  Heading.swift
//  advanced-codables-demo
//
//  Created by Avijeet on 01/04/24.
//

import Foundation

struct Heading: Decodable {
    let text: String
    let size: Int
}

struct Paragraph: Decodable {
    let text: String
}


struct Image: Decodable {
    let url: String
    let caption: String
    let source: String
}

struct Quote: Decodable {
    let text: String
    let author: String
}


