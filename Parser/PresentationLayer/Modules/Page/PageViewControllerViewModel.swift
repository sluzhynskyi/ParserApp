//
//  PageViewControllerViewModel.swift
//  Parser
//
//  Created by Danylo Sluzhynskyi on 13.02.2023.
//

import Foundation

final class PageViewControllerViewModel: ControllerViewModel {

    // MARK: - Types

    typealias UpdateImageData = (_ content: Data) -> Void


    // MARK: - Properties

    private var content: ImagePage
    private var downloadService: DownloadService

    // MARK: - CallBacks

    private var updateFirstImageData: UpdateImageData?
    private var updateSecondImageData: UpdateImageData?
    private var updateThirdImageData: UpdateImageData?

    var firstImageData: Data?
    var secondImageData: Data?
    var thirdImageData: Data?

    // MARK: - Initialization

    init(content: ImagePage, downloadService: DownloadService) {
        self.content = content
        self.downloadService = downloadService

        updateFirstImageData = { [weak self] data in
            self?.firstImageData = data
        }

        updateSecondImageData = { [weak self] data in
            self?.secondImageData = data
        }

        updateThirdImageData = { [weak self] data in
            self?.thirdImageData = data
        }
    }

    // MARK: - Configuration

    func configure() {

    }

    // MARK: - Appearance

    func title() -> String {
        content.title
    }

    func details() -> String {
        content.details
    }

    func loadContent(loadedCallBack: @escaping EmptyClosure) {
        let urls = [content.firstImg, content.secondImg, content.thirdImg].compactMap(URL.init(string:))
        let callBacks = [updateFirstImageData, updateSecondImageData, updateThirdImageData]

        let contents = Array(zip(urls, callBacks))

        let group = DispatchGroup()

        contents.forEach { url, callBack in
            group.enter()
            downloadService.loadData(url: url) { (data, error) in
                data.flatMap { data in
                    callBack?(data)
                    group.leave()
                }

                error.flatMap { error in
                    print(error)
                    group.leave()
                }
            }
        }

        group.notify(queue: .main) {
            loadedCallBack()
        }
    }
}

