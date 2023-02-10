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
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
    }
    
    
    // MARK: - View
    // MARK: Configuration
    
    override func configureView() { 
        super.configureView()

    }
    
    // MARK: - ViewModel
    // MARK: Configuration
    
    override func configureViewModel() { 
        super.configureViewModel()
        
        
    }
}
