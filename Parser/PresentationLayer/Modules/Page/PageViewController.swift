//
//  PageViewController.swift
//  Parser
//
//  Created by Danylo Sluzhynskyi on 13.02.2023.
//

import UIKit

final class PageViewController: Controller<
    PageViewControllerLayout,
    PageViewControllerViewModel
> {
    // MARK: - Types

    // MARK: - Types



    // MARK: - Properties
    // MARK: Callbacks



    // MARK: Views

    private(set) lazy var scrollView = UIScrollView {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    private(set) lazy var contentView = View {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    private(set) lazy var firstImageView = UIImageView {
        $0.layer.masksToBounds = true
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    private(set) lazy var secondImageView = UIImageView {
        $0.layer.masksToBounds = true
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    private(set) lazy var thirdImageView = UIImageView {
        $0.layer.masksToBounds = true
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }


    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
    }


    // MARK: - View
    // MARK: Configuration

    override func configureView() {
        super.configureView()

        guard let firstImageData = viewModel.firstImageData,
              let secondImageData = viewModel.secondImageData,
              let thirdImageData = viewModel.thirdImageData else {
            return
        }

        firstImageView.image = UIImage(data: firstImageData)
        secondImageView.image = UIImage(data: secondImageData)
        thirdImageView.image = UIImage(data: thirdImageData)

    }

    // MARK: - ViewModel
    // MARK: Configuration

    override func configureViewModel() {
        super.configureViewModel()

    }
}

