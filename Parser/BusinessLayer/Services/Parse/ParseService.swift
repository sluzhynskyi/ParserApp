    //
    //  ParseService.swift
    //  Parser
    //
    //  Created by Danylo Sluzhynskyi on 10.02.2023.
    //

import Foundation

struct ParseService {

    // MARK: - Appearance

    func parse<T: Parsable>(_: T.Type, from data: String) -> T? {
        let keyWords = T.allKeys + [""]
        var captures = [String: String]()
        for index in 0..<keyWords.count - 1 {
            let keyWord = keyWords[index]
            let nextKeyWord = keyWords[index + 1]
            let pattern = "((?<=\(keyWord)\\:).*(?=\(nextKeyWord)))"

            if let match = firstMatch(for: pattern, in: data) {
                captures[keyWord] = match
            }
        }
        do {
            let JSONData = try JSONEncoder().encode(captures)
            let instance = try JSONDecoder().decode(T.self, from: JSONData)

            return instance
        } catch let jsonError as NSError {
            print("JSON decode failed: \(jsonError.localizedDescription)")
        }

        return nil
    }

    private func firstMatch(for patter: String, in text: String) -> String? {
        guard let result = text.range(of: patter, options:.regularExpression) else  {
            return nil
        }

        return String(text[result])
    }
}


protocol Parsable: Decodable {
    static var allKeys: [String] { get }
}
