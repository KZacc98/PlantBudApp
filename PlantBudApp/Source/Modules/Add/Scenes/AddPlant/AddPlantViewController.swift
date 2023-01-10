//
//  AddPlantViewController.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 08/01/2023.
//

import UIKit

final class AddPlantViewController: BaseTableViewController {
    
    //MARK: - Public properties
    
    public var viewModel: AddPlantViewModel!
    
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
        viewModel.loadData()
        bindViewModel()
//        viewModel.buildEmptySections()
        
    }
    
    // MARK: - Selectors
    
    override func refreshData(_ refreshControl: UIRefreshControl) {
        viewModel.loadData()
    }

}

//MARK: - Data binding

extension AddPlantViewController {
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
        
//        viewModel.onFetchSuccess = { [weak self] in
//            self?.viewModel.buildSections()
//        }
    }
    
    
}

//MARK: - Setup

extension AddPlantViewController {
    private func setupView() {
        view.backgroundColor = .blue //kolor ViewControllera
    }
    
    private func setupNavigationBar() {
//        let userButtonBar = UIBarButtonItem(image: Assets.Common.user,
//                                            style: .plain,
//                                            target: self,
//                                            action: #selector(didPressUserButton(sender:)))
//        userButtonBar.accessibilityLabel = "userSideMenuAccessibilityLabel".localized
//        userButtonBar.tintColor = Color.brandGreen
//        navigationItem.rightBarButtonItem = userButtonBar
        title = "AddPlant"
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




