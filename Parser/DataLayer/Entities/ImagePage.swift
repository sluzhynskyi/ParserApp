//
//  ImagePage.swift
//  Parser
//
//  Created by Danylo Sluzhynskyi on 10.02.2023.
//

import Foundation

struct ImagePage: Equatable, Hashable, Parsable {

    // MARK: - Properties

    let title: String
    let firstImg: String
    let secondImg: String
    let thirdImg: String
    let details: String

    enum CodingKeys: String, CodingKey, CaseIterable {
        case title
        case firstImg = "firstimg"
        case secondImg = "secondimg"
        case thirdImg = "thirdimg"
        case details
    }

    static var allKeys: [String] {
        CodingKeys.allCases.map { $0.stringValue }
    }

    // MARK: - Equatable

    static func == (
        lhs: ImagePage,
        rhs: ImagePage
    ) -> Bool {
        lhs.title == rhs.title &&
        lhs.firstImg == rhs.firstImg &&
        lhs.secondImg == rhs.secondImg &&
        lhs.thirdImg == rhs.thirdImg &&
        lhs.details == rhs.details
    }


    // MARK: - Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(details)
    }
}

