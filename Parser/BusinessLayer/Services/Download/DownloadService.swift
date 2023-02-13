//
//  DownloadService.swift
//  Parser
//
//  Created by Danylo Sluzhynskyi on 13.02.2023.
//

import Foundation

struct DownloadService {
    func loadData(url: URL, completion: @escaping (Data?, Error?) -> Void) {
        let fileCachePath = FileManager.default.temporaryDirectory
            .appendingPathComponent(
                url.lastPathComponent,
                isDirectory: false
            )

        if let data = try? Data(contentsOf: fileCachePath) {
            completion(data, nil)
            return
        }

        download(url: url, toFile: fileCachePath) { (error) in
            let data = try? Data(contentsOf: fileCachePath)
            completion(data, error)
        }
    }

    private func download(url: URL, toFile file: URL, completion: @escaping (Error?) -> Void) {
        let task = URLSession.shared.downloadTask(with: url) {
            (tempURL, response, error) in
            guard let tempURL = tempURL else {
                completion(error)
                return
            }

            do {
                if FileManager.default.fileExists(atPath: file.path) {
                    try FileManager.default.removeItem(at: file)
                }

                try FileManager.default.copyItem(
                    at: tempURL,
                    to: file
                )

                completion(nil)
            }

            catch let fileError {
                completion(fileError)
            }
        }

        task.resume()
    }
}
