//
//  BadgesViewController.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 05/12/2022.
//

import UIKit

final class BadgesViewController: BaseTableViewController {
    
    //MARK: - Public properties
    
    public var viewModel: BadgesViewModel!
    
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
//        viewModel.buildSections()
        
    }
    
    // MARK: - Selectors

}

//MARK: - Data binding

extension BadgesViewController {
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
    }
}

//MARK: - Setup

extension BadgesViewController {
    private func setupView() {
        view.backgroundColor = Color.brandWhite//kolor ViewControllera
    }
    
    private func setupNavigationBar() {
//        let userButtonBar = UIBarButtonItem(image: Assets.Common.user,
//                                            style: .plain,
//                                            target: self,
//                                            action: #selector(didPressUserButton(sender:)))
//        userButtonBar.accessibilityLabel = "userSideMenuAccessibilityLabel".localized
//        userButtonBar.tintColor = Color.brandGreen
//        navigationItem.rightBarButtonItem = userButtonBar
        title = "badgesTitle".localized
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



