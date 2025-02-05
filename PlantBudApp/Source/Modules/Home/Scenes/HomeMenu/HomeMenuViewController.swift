//
//  HomeMenuViewController.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 27/11/2022.
//

import UIKit

final class HomeMenuViewController: BaseTableViewController {
    
    //MARK: - Public properties
    
    public var onUserProfileTapped: (() -> ())?
    public var viewModel: HomeMenuViewModel!
    
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
        setupEmptyDataView()
        setupTableView()
        bindViewModel()
        viewModel.loadData()
    }
    
    // MARK: - Selectors
    
    @objc private func didPressUserButton(sender: UIBarButtonItem) {
        onUserProfileTapped?()
    }
    
    override func refreshData(_ refreshControl: UIRefreshControl) {
        viewModel.loadData(refresh: true)
    }
}

//MARK: - Data binding

extension HomeMenuViewController {
    private func bindViewModel() {
        viewModel.onSectionSequenceChange = { [weak self] sectionSequence in
            self?.dataSource.sections = sectionSequence.sections
            if self?.isViewLoaded ?? false {
                self?.setupEmptyDataView(with: EmptyDataType(sectionSequence: sectionSequence))
                self?.registerReusableViews(from: sectionSequence.sections)
                self?.tableView.reloadData()
                self?.refreshControl.endRefreshing()
            }
        }
        
        viewModel.onFetchSuccess = {[weak self] res in
            self?.makeToast(with: res)
        }
        
        viewModel.onError = { [weak self] error in
            UIAppDelegate?.hideLoadingIndicator()
            self?.setupEmptyDataView(
                with: EmptyDataType(
                    error: error,
                    customTitle: error.localizedDescription))
            self?.showErrorDialog(
                with: error,
                dismissBlock: {
                    self?.refreshControl.endRefreshing()
                })
        }
    }
}

//MARK: - Setup

extension HomeMenuViewController {
    private func setupView() {
        view.backgroundColor = Color.brandWhite
    }
    
    private func setupNavigationBar() {
        let userButtonBar = UIBarButtonItem(
            image: UIImage(systemName: "person.circle.fill"),
            style: .plain,
            target: self,
            action: #selector(didPressUserButton(sender:)))
        
        userButtonBar.tintColor = Color.brandGreen
        navigationItem.rightBarButtonItem = userButtonBar
        navigationItem.title = "homeTitle".localized
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
        tableView.backgroundColor = Color.brandWhite
        tableView.refreshControl = refreshControl
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 12, right: 0)
    }
}
