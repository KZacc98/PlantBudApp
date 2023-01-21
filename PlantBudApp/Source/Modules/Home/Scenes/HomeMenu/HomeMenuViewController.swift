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
        self.onUserProfileTapped?()
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
    
//
//        viewModel.onError = { [weak self] error in
//            self?.setupEmptyDataView(with: EmptyDataType(error: error,
//                                                         customTitle: "emptyDataMyDietError".localized))
//            self?.showErrorDialog(with: error, dismissBlock: {
//                self?.refreshControl.endRefreshing()
//            })
//        }
//
//        viewModel.onSetupNavigationBarTitle = { [weak self] title in
//            self?.title = title
//            self?.navigationItem.titleView = nil
//        }
//
//        viewModel.onSetupNavigationBarView = { [weak self] view in
//            self?.navigationItem.titleView = view
//            self?.title = nil
//        }
//    }
//
//    private func addObservers() {
//        UserContext.shared.userPanelObservable.addObserver(
//        self, options: [.initial, .new]) { [weak self] userPanel, options in
//            self?.viewModel.setupUserPanel(userPanel)
//        }
//
//        UserContext.shared.userProfileObservable.addObserver(
//        self, options: [.initial, .new]) { [weak self] userProfile, options in
//            self?.viewModel.setupUserProfile(userProfile)
//        }
//    }
}

//MARK: - Setup

extension HomeMenuViewController {
    private func setupView() {
        view.backgroundColor = Color.brandWhite //kolor ViewControllera
    }
    
    private func setupNavigationBar() {
        let userButtonBar = UIBarButtonItem(image: UIImage(systemName: "person.circle.fill"),
                                            style: .plain,
                                            target: self,
                                            action: #selector(didPressUserButton(sender:)))
        userButtonBar.tintColor = Color.brandGreen
        navigationItem.rightBarButtonItem = userButtonBar
//        UINavigationBar.setItems([userButtonBar], animated: true)
        navigationItem.title = "Hello"
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
            
//            let onRefreshData: () -> () = { [weak self] in
//                self?.viewModel.loadData(refresh: true)
//            }
//
//            let buttonAction: () -> () = { [weak self] in
//                if let ordersDisabled = UserContext.shared.userPanel?.company.continueOrdersDisabled, ordersDisabled == true {
//                    self?.onOrdersDisabled?()
//                } else {
//                    let tabBarCoordinator = UIAppDelegate?.applicationCoordinator?.childCoordinator as? TabBarCoordinator
//                    tabBarCoordinator?.selectTabBarItem(for: .orders)
//                    (tabBarCoordinator?.childCoordinator as? OrdersCoordinator)?.pushNewOrder(order: nil, animated: false)
//                }
//            }
//
//            let didSelectItemAtIndexPath: (IndexPath) -> () = { [weak self] indexPath in
//                self?.viewModel.didSelectDiscount(indexPath: indexPath)
//            }
//
//            let descriptionText = "myDietEmptyDataLabelString".localized + "\n" + "myDietNoBoughtDietEmptyData".localized
//            let company = UserContext.shared.userPanel?.company
//            let companyInformation = company?.companyInfo?.infoDesktop
//            let cellConfigurators = company?.discountList.map {
//                DiscountCellConfigurator(data: DiscountCellData(remote: $0))
//            }
//            let companyImage = UserContext.shared.userPanel?.company.logo.landscapeImageForSize(._640x480)
//            let data = MyDietEmptyData(
//                companyImage: companyImage ?? "",
//                description: descriptionText,
//                companyInformation: companyInformation,
//                buttonTitle: "myDietMakeAnOrder".localized.uppercased(),
//                buttonAction: buttonAction,
//                cellConfigurators: cellConfigurators ?? [],
//                didSelectItemAtIndexPath: didSelectItemAtIndexPath,
//                refreshControl: refreshControl,
//                onRefreshData: onRefreshData)
//            emptyDataView.configure(data: data)
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

