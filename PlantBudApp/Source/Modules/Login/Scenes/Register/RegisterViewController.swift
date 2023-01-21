//
//  RegisterViewController.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 21/01/2023.
//

import UIKit
import Lottie

class RegisterViewController: BaseTableViewController, TableViewControllerInterface {
    
    // MARK: - Navigation binding
    
    public var onLoginSuccess: (() -> ())?
    //public var onTextItemPressed: ((ContentCode) -> ())?
    
    // MARK: - Public properties
    
    public var viewModel: RegisterViewModel!
    
    override var tableViewStyle: UITableView.Style {
        return .grouped
    }
    
    //MARK: - Private properties
    
    private let dataSource: BaseTableViewDataSource = BaseTableViewDataSource()
    
    //MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //        addKeyboardObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //        removeKeyboardObservers()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupNavigationBar()
        setupTableView()
        bindViewModel()
        viewModel.buildSections()
    }
    
    override func setupAutoLayout() {
        NSLayoutConstraint.activate(
            [tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
             tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
             tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
             tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)]
        )
    }
    
    // MARK: - Override methods
}

extension RegisterViewController {
    private func bindViewModel() {
        viewModel.onSectionSequenceChange = { [weak self] sectionSequence in
            self?.dataSource.sections = sectionSequence.sections
            if self?.isViewLoaded ?? false {
                self?.registerReusableViews(from: sectionSequence.sections)
                self?.tableView.reloadData()
            }
        }
        
//        viewModel.onLoginButtonPressed = { [weak self] in
//            self?.view.endEditing(true)
//            self?.viewModel.validate { [weak self] errors, indexPaths in
//                self?.tableView.reloadRows(at: indexPaths, with: .none)
//                if errors.isEmpty {
////                    UIAppDelegate?.showLoadingIndicator()
//                    self?.viewModel.authenticate()
//                } else if let firstIndexPath = indexPaths.first {
//                    self?.tableView.scrollToRow(at: firstIndexPath, at: .middle, animated: true)
//                }
//            }
//        }

//        viewModel.onLoginSuccess = { [weak self] name in
//            self?.onLoginSuccess?()
//            UIAppDelegate?.hideLoadingIndicator()
//            self?.makeToast(with: name)
//        }
        
//        viewModel.onLoginFailure = { [weak self] in
//            UIAppDelegate?.hideLoadingIndicator()
//            self?.showInformationDialog(message: "Incorrect login credentials", dismissBlock: {Logger.info("dismiss")})
//        }

//        viewModel.onTextItemPressed = { [weak self] code in
//            self?.onTextItemPressed?(code)
//        }
        
        viewModel.hideKeyboard = { [weak self] in
            self?.view.endEditing(true)
        }
        
//        viewModel.onError = { error in
//            DialogManager.showErrorDialog(with: error)
//        }
    }
}

//MARK: - Setup

extension RegisterViewController {
    private func setupView() {
        view.backgroundColor = Color.brandWhite
    }
    
    private func setupNavigationBar() {
        title = "Login"
    }
    
    private func setupTableView() {
        tableView.backgroundColor = Color.brandWhite
        tableView.separatorStyle = .none
        tableView.delegate  = self.dataSource
        tableView.dataSource = self.dataSource
        tableView.bounces = false
        tableView.estimatedRowHeight = 68.75
//        tableView.isScrollEnabled = false
        let safeAreaHeight: CGFloat = view.safeAreaLayoutGuide.layoutFrame.size.height
        let isSmallDevice: Bool = (self.isSmallDevice || UIDevice.current.screenType == .iPhones_6_6s_7_8)
        tableView.estimatedSectionHeaderHeight = isSmallDevice ? safeAreaHeight * 0.4 : safeAreaHeight * 0.467
    }
}
