//
//  Controller.swift
//  SimpleApp
//
//  Created by Danylo Sluzhynskyi on 29.07.2021.
//

import UIKit

class Controller<
    Layout: ViewLayout,
    ViewModel: ControllerViewModel
>: ViewController<View, Layout, ViewModel> {

    // MARK: - Initialization

    init(
        viewModel: ViewModel
    ) {
        super.init(viewModel: viewModel)
    }

    required init?(coder aDecoder: NSCoder) {
        nil
    }
}

class ViewController<
    RootView: View,
    Layout: ViewLayout,
    ViewModel: ControllerViewModel
>: UIViewController, LayoutView {

    // MARK: - Properties
    // MARK: Appearance

    override var prefersStatusBarHidden: Bool {
        false
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

    // MARK: View

    let rootView: RootView
    private(set) lazy var layout: Layout = configuredLayout()

    private lazy var viewWillAppearWasCalled = false
    private lazy var viewDidAppearWasCalled = false
    private lazy var viewDidLayoutSubviewsWasCalled = false

    // MARK: ViewModel

    let viewModel: ViewModel


    // MARK: - Initialization

    init(
        rootView: RootView = RootView().apply { view in
            view.backgroundColor = .white
        },
        viewModel: ViewModel
    ) {
        self.rootView = rootView
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        nil
    }

    deinit {
        print("☠️\(String(describing: self))☠️")
    }


    // MARK: - View lifecycle

    override func loadView() {
        self.view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        configureViewModel()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setNeedsStatusBarAppearanceUpdate()

        if !viewWillAppearWasCalled {
            viewWillAppearWasCalled = true

            performOnceInViewWillAppear()
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if !viewDidAppearWasCalled {
            viewDidAppearWasCalled = true

            performOnceInViewDidAppear()
        }
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        layout.willLayoutSubviews()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if !viewDidLayoutSubviewsWasCalled {
            viewDidLayoutSubviewsWasCalled = true

            performOnceInViewDidLayoutSubviews()
        }

        layout.didLayoutSubviews()
    }


    // MARK: - View
    // MARK: Configuration

    func configureView() {
        extendedLayoutIncludesOpaqueBars = false
        edgesForExtendedLayout = []

        processLayout()
    }

    // MARK: Layout

    func processLayout() {
        layout.process()
    }

    func layoutContent() {
        view.setNeedsLayout()
        view.layoutIfNeeded()
    }

    func relayoutContent() {
        if viewDidAppearWasCalled {
            layoutContent()
        }
    }

    // MARK: Updates

    func performOnceInViewWillAppear() { }
    func performOnceInViewDidAppear() { }
    func performOnceInViewDidLayoutSubviews() { }


    // MARK: - ViewModel
    // MARK: Configuration

    func configureViewModel() {
        viewModel.configure()
    }
}

