//
//  HomeController.swift
//  SimpleApp
//
//  Created by Danylo Sluzhynskyi on 30.07.2021.
//

import UIKit

final class HomeController: Controller<
    HomeControllerLayout,
    HomeControllerViewModel
> {
    // MARK: - Types

        // MARK: - Types

    typealias Provider = PagesTableViewProvider
    
    // MARK: - Properties
    // MARK: Callbacks

    var willShowPageAction: Provider.WillShowPageAction?

    // MARK: Views

    private(set) lazy var tableView = UITableView {
        $0.backgroundColor = .clear
        $0.backgroundView?.backgroundColor = .clear
        $0.separatorStyle = .none
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    // MARK: - Provider

    private(set) lazy var contentProvider = PagesTableViewProvider(
        tableView: tableView,
        viewModel: viewModel
    )
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
    }
    
    
    // MARK: - View
    // MARK: Configuration
    
    override func configureView() { 
        super.configureView()

        configureContentProvider()
    }

    private func configureContentProvider() {
        contentProvider.reloadData()

        contentProvider.willShowPageAction = { [unowned self] content in
            self.willShowPageAction?(content)
        }
    }
    
    // MARK: - ViewModel
    // MARK: Configuration
    
    override func configureViewModel() { 
        super.configureViewModel()
        
        viewModel.loadContent()
    }
}
