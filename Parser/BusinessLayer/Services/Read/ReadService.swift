//
//  ReadService.swift
//  Parser
//
//  Created by Danylo Sluzhynskyi on 10.02.2023.
//

import Foundation

struct JSONReadService: ReadService {

    // MARK: - Appearance

    func readLocalFile(forName name: String, ofType type: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: type),
               let data = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return data
            }
        } catch {
            print(error)
        }

        return nil
    }

    func loadJSON(of data: Data) -> [String]? {
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String] {
                return json
            }
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
        }

        return nil
    }
}

protocol ReadService {
    func readLocalFile(forName name: String, ofType type: String) -> Data?
    func loadJSON(of data: Data) -> [String]?
}
