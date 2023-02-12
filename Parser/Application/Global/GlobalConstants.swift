//
//  GlobalConstants.swift
//  Parser
//
//  Created by Danylo Sluzhynskyi on 10.02.2023.
//

import Foundation

enum GlobalConstants {
    static var privacyPolicy: URL {
        URL(string: "https://apple.com")!
    }

    static var termsAndCondition: URL {
        URL(string: "https://apple.com")!
    }

    static var appName: String {
        "Parser"
    }

    static var resourceDB: (name: String, type: String) {
        ("task", "json")
    }
}

