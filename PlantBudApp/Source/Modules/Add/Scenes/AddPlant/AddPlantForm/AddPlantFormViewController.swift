//
//  AddPlantFormViewController.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 08/01/2023.
//

import UIKit

final class AddPlantFormViewController: BaseTableViewController, TableViewControllerInterface {
    
    //MARK: - Public properties
    
    public var viewModel: AddPlantFormViewModel!
    
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
        setupEmptyDataView()
        setupTableView()
        bindViewModel()
        addBackButton()
        viewModel.loadData()
        viewModel.buildEmptySections()
        
    }
    
    // MARK: - Selectors
    
    override func refreshData(_ refreshControl: UIRefreshControl) {
        viewModel.loadData()
    }

}

//MARK: - Data binding

extension AddPlantFormViewController {
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
        viewModel.onAddPlantRequestButtonPressed = { [weak self] plantName, plantType in
            self?.view.endEditing(true)
            self?.viewModel.validate { [weak self] errors, indexPaths in
                self?.tableView.reloadRows(at: indexPaths, with: .none)
                if errors.isEmpty {
//                    UIAppDelegate?.showLoadingIndicator()
                    self?.viewModel.makeAddPlantRequest(plantName: plantName, plantType: plantType)
                } else if let firstIndexPath = indexPaths.first {
                    self?.tableView.scrollToRow(at: firstIndexPath, at: .middle, animated: true)
                }
            }
        }
    }
    
    
}

//MARK: - Setup

extension AddPlantFormViewController {
    private func setupView() {
        view.backgroundColor = Color.brandWhite //kolor ViewControllera
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





