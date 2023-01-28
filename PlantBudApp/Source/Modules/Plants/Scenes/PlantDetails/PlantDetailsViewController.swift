//
//  PlantDetailsViewController.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 16/12/2022.
//

import UIKit

final class PlantDetailsViewController: BaseTableViewController {
    
    //MARK: - Public properties
    
//    public var onOrdersDisabled: (() -> ())?
    public var viewModel: PlantDetailsViewModel!
    
    //MARK: - Private properties
    
    private let dataSource: BaseTableViewDataSource = BaseTableViewDataSource()
    
    //MARK: - Override properties
    
    override var tableViewStyle: UITableView.Style {
        return .grouped
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupNavigationBar()
        addBackButton()
        setupEmptyDataView()
        setupTableView()
        bindViewModel()
        viewModel.loadData()
        
        
        
//        addObservers()
//        StoreReviewClient.requestForReview()
    }
    
//    deinit {
//        UserContext.shared.userPanelObservable.removeObserver(self)
//        UserContext.shared.userProfileObservable.removeObserver(self)
//    }
    
    // MARK: - Selectors
    
    @objc private func didPressUserButton(sender: UIBarButtonItem) {
        Logger.error("USER PRESSED")
    }
    
    override func refreshData(_ refreshControl: UIRefreshControl) {
//        viewModel.loadData(refresh: true)
        Logger.info(viewModel.routineSteps?.debugDescription ?? "")
        viewModel.prepareSteps(steps: viewModel.routineSteps ?? [])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.backBarButtonItem?.tintColor = .red
        viewModel.fetchData()
    }
}

//MARK: - Data binding

extension PlantDetailsViewController {
    private func bindViewModel() {
        viewModel.onSectionSequenceChange = { [weak self] sectionSequence in
            self?.dataSource.sections = sectionSequence.sections
            if self?.isViewLoaded ?? false {
                self?.setupEmptyDataView(with: EmptyDataType(sectionSequence: sectionSequence))
                self?.registerReusableViews(from: sectionSequence.sections)
                self?.tableView.reloadData()
                self?.refreshControl.endRefreshing()
//                (self?.dataSource.emptyDataView as? EmptyDataView)
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                    self?.tableView.flashScrollIndicators()
//                }
            }
        }
        
        viewModel.onFetchSuccess = {[weak self] res in
            self?.makeToast(with: res)
        }
    }
}

//MARK: - Setup

extension PlantDetailsViewController {
    private func setupView() {
        view.backgroundColor = Color.brandWhite //kolor ViewControllera
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "plantDetailsTitle".localized
    }
    
    private func setupEmptyDataView(with type: EmptyDataType = .none) {
        switch type {
        case .none, .errorOccurred, .loading:
            tableView.bounces = true
            emptyDataView.configure(type: type, contentOffset: emptyDataDefaultContentOffset)
            dataSource.emptyDataView = emptyDataView
        case .noData:
            tableView.bounces = false
            let emptyDataView = EmptyDataView()
            dataSource.emptyDataView = emptyDataView
        }
    }
    
    private func setupTableView() {
        tableView.delegate  = self.dataSource
        tableView.dataSource = self.dataSource
        tableView.separatorStyle = .none
        tableView.backgroundColor = Color.brandWhite //KOLOR TŁA PO STARCIE
        tableView.refreshControl = refreshControl
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 12, right: 0)
    }
}


