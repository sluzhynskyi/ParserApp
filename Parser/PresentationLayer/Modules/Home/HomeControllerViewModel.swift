//
//  HomeControllerViewModel.swift
//  SimpleApp
//
//  Created by Danylo Sluzhynskyi on 30.07.2021.
//

import Foundation

final class HomeControllerViewModel: ControllerViewModel {

    // MARK: - Types

    typealias Item = PageCellViewModel

    // MARK: - Properties

    private var readService: ReadService
    private var parseService: ParseService
    private lazy var items = [Item]()

    // MARK: - Initialization

    init(readService: ReadService, parseService: ParseService) {
        self.readService = readService
        self.parseService = parseService
    }
    
    // MARK: - Configuration
    
    func configure() {
        
    }

    func loadContent() {
        let file = GlobalConstants.resourceDB
        let pages = readService.readLocalFile(forName: file.name, ofType: file.type)
            .flatMap { readService.loadJSON(of: $0) }?
            .map { parseService.parse(ImagePage.self, from: $0)}
            .compactMap { $0 }

        if let pages = pages {
            self.items = pages.compactMap(
                Item.init(content:)
            )
        }
    }

    // MARK: - Provider

    func numberOfItems() -> Int {
        items.count
    }

    func item(at index: Int) -> Item {
        items[index]
    }
}
