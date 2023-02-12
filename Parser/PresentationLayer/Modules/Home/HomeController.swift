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

    enum MyError: Error {
        case anError
    }

    
    // MARK: - Properties
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
        
//        view.backgroundColor = .blue

    }
    
    
    // MARK: - View
    // MARK: Configuration
    
    override func configureView() { 
        super.configureView()

        configureContentProvider()
    }

    private func configureContentProvider() {
        contentProvider.reloadData()
    }
    
    // MARK: - ViewModel
    // MARK: Configuration
    
    override func configureViewModel() { 
        super.configureViewModel()
        
        viewModel.loadContent()
    }
}
