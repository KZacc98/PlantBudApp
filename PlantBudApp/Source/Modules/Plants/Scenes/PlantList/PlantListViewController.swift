//
//  PlantsViewController.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 05/12/2022.
//

import UIKit

final class PlantListViewController: BaseTableViewController {
    
    //MARK: - Public properties
    public var onAddPlantTapped: (() -> ())?
    public var onFirstOpen: (() -> ())?
    public var viewModel: PlantListViewModel!
    
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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        Network.shared.apollo.store.clearCache()
        viewModel.loadData()
    }
    
//    override func view
//        super.viewDidLayoutSubviews()
//        self.onFirstOpen?()
//    }
    
    // MARK: - Selectors
    
    override func refreshData(_ refreshControl: UIRefreshControl) {
        viewModel.loadData()
    }
    @objc private func didPressAddPlantButton(sender: UIBarButtonItem) {
        Logger.error("AddPlantPressed")
        self.onAddPlantTapped?()
    }

}

//MARK: - Data binding

extension PlantListViewController {
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
//            self?.onFirstOpen?()
//        }
    }
    
    
}

//MARK: - Setup

extension PlantListViewController {
    private func setupView() {
        view.backgroundColor = Color.brandWhite //kolor ViewControllera
    }
    
    private func setupNavigationBar() {
        let addPlantButtonBar = UIBarButtonItem(image: UIImage(systemName: "plus.rectangle.fill"),
                                            style: .plain,
                                            target: self,
                                            action: #selector(didPressAddPlantButton(sender:)))
        addPlantButtonBar.tintColor = Color.brandGreen
        navigationItem.rightBarButtonItem = addPlantButtonBar
        title = "plantListTitle".localized
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


