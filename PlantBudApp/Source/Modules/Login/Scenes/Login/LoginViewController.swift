//
//  LoginViewController.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 19/11/2022.
//

import UIKit
import Lottie

class LoginViewController: BaseTableViewController, TableViewControllerInterface {
    
    // MARK: - Navigation binding
    
    public var onLoginSuccess: (() -> ())?
    //public var onTextItemPressed: ((ContentCode) -> ())?
    
    // MARK: - Public properties
    
    public var viewModel: LoginViewModel!
    
    override var tableViewStyle: UITableView.Style {
        return .grouped
    }
    
    //MARK: - Private properties
    
    private let dataSource: BaseTableViewDataSource = BaseTableViewDataSource()
    
    private lazy var appVersionLabel: AppVersionLabel = {
        let label = AppVersionLabel()
        view.addSubviewsUsingAutoLayout(label)
        
        return label
    }()
    
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
    
    // MARK: - Override methods
}

extension LoginViewController {
    private func bindViewModel() {
        viewModel.onSectionSequenceChange = { [weak self] sectionSequence in
            self?.dataSource.sections = sectionSequence.sections
            if self?.isViewLoaded ?? false {
                self?.registerReusableViews(from: sectionSequence.sections)
                self?.tableView.reloadData()
            }
        }
        
        viewModel.onLoginButtonPressed = { [weak self] in
            self?.view.endEditing(true)
            self?.viewModel.validate { [weak self] errors, indexPaths in
                self?.tableView.reloadRows(at: indexPaths, with: .none)
                if errors.isEmpty {
//                    UIAppDelegate?.showLoadingIndicator()
                    self?.viewModel.authenticate()
                } else if let firstIndexPath = indexPaths.first {
                    self?.tableView.scrollToRow(at: firstIndexPath, at: .middle, animated: true)
                }
            }
        }

        viewModel.onLoginSuccess = { [weak self] name in
            self?.onLoginSuccess?()
            UIAppDelegate?.hideLoadingIndicator()
            self?.makeToast(with: name)
        }

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

extension LoginViewController {
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
        let safeAreaHeight: CGFloat = view.safeAreaLayoutGuide.layoutFrame.size.height
        let isSmallDevice: Bool = (self.isSmallDevice || UIDevice.current.screenType == .iPhones_6_6s_7_8)
        tableView.estimatedSectionHeaderHeight = isSmallDevice ? safeAreaHeight * 0.4 : safeAreaHeight * 0.467
    }
}

//// MARK: - Keyboard observers
//
//extension LoginViewController {
//    private func addKeyboardObservers() {
//        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
//    }
//
//    private func removeKeyboardObservers() {
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
//    }
//
//    @objc func keyboardWillShow(notification: NSNotification) {
//        guard let keyboardRect = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
//            return
//        }
//        self.tableView.contentInset.bottom = keyboardRect.cgRectValue.size.height + 25
//    }
//
//    @objc func keyboardWillHide(notification: NSNotification) {
//        self.tableView.contentInset.bottom = 0.0
//    }
//}

