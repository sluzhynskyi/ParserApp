//
//  PageCellViewModel.swift
//  Parser
//
//  Created by Danylo Sluzhynskyi on 12.02.2023.
//

final class PageCellViewModel: ViewModel, Equatable, Hashable {

    // MARK: - Properties

    let content: ImagePage

    let title: String
    let details: String


    // MARK: - Initialization

    init(content: ImagePage) {
        self.content = content
        self.title = content.title
        self.details = content.details
    }


    // MARK: - Equatable

    static func == (
        lhs: PageCellViewModel,
        rhs: PageCellViewModel
    ) -> Bool {
        lhs.title == rhs.title &&
        lhs.details == rhs.details
    }


    // MARK: - Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(details)
    }
}


