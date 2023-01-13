//
//  LoginViewModel.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 20/11/2022.
//

import UIKit

class LoginViewModel {
    
    //MARK: - Binding closures
    
    public var onSectionSequenceChange: ((SectionSequence) -> Void)?
    public var onLoginButtonPressed: (() -> ())?
    public var onLoginSuccess: ((String) -> ())?
    public var onLoginFailure: (() -> ())?

    //public var onTextItemPressed: ((ContentCode) -> ())?
    public var hideKeyboard: (() -> ())?
    public var onRecoverPassword: (() -> ())?
    public var onError: ((Error) -> ())?

    //MARK: - Private properties

    private var loginCredentials: LoginCredentials
    private weak var tableViewInterface: TableViewControllerInterface?
    private let defaults = UserDefaults.standard
    
    private var sectionSequence: SectionSequence = SectionSequence() {
        didSet {
            onSectionSequenceChange?(sectionSequence)
        }
    }
    
    private var inputs: [InputInterface] {
        return [loginInputCellConfigurator, passwordInputCellConfigurator]
    }
    
//    private var currentFirstResponderInput: InputInterface? {
//        didSet {
//            guard let items = textInputCellInputAccessoryView.items,
//                items.indices.contains(0), items.indices.contains(1) else {
//                    return
//            }
//            let currentFirstResponderIsInput = currentFirstResponderInput === loginInputCellConfigurator
////            textInputCellInputAccessoryView.items?[0].isEnabled = !currentFirstResponderIsInput
////            textInputCellInputAccessoryView.items?[1].isEnabled = currentFirstResponderIsInput
//        }
//    }
    
    // MARK: - Form items

    private lazy var headerConfigurator: AnimationHeaderConfigurator = {
        let data = AnimationHeaderData(animationName: "plant_walking")
        
        return AnimationHeaderConfigurator(data: data)
//        let data = LoginHeaderData(backgroundColor: Color.loginBackground,
//                                   imageUrl: URL(string: loginSettings?.logo ?? ""),
//                                   helloTitle: loginSettings?.firstName,
//                                   hideKeyboard: hideKeyboard)
//
//        return LoginHeaderConfigurator(data: data)
    }()
    

    private lazy var loginInputCellConfigurator: LoginTextInputCellConfigurator = {
        let allowedCharacters = CharacterSet.alphanumerics.union(CharacterSet.symbols)
                                                          .union(CharacterSet.punctuationCharacters)
                                                          .union(CharacterSet.whitespaces)
        let data = TextInputCellData(title: "loginTitleText".localized.uppercased(),
                                     placeHolder: "loginPlaceHolder".localized,
                                     text: loginCredentials.username,
                                     isSecureTextEntry: false,
                                     validator: TextValidator(minimumLength: 3,
                                                              maximumLength: 254,
                                                              allowedCharacters: allowedCharacters))
        let configurator = LoginTextInputCellConfigurator(data: data)
        let textFieldDidEndEditing: (String?) -> () = { [weak self, weak configurator] text in
            guard let configurator = configurator else { return }
            configurator.data.text = text
            self?.loginCredentials.username = text
            ValidationManager.validate(validableInputViewConfigurator: configurator,
                                       sectionSequence: self?.sectionSequence,
                                       tableViewInterface: self?.tableViewInterface)
        }

        configurator.data.textfieldDidEndEditing = textFieldDidEndEditing

        configurator.didBecomeFirstResponder = { [weak self] input in
//            self?.currentFirstResponderInput = input
        }

        return configurator
    }()
    
    private lazy var passwordInputCellConfigurator: TextInputCellConfigurator = {
        let allowedCharacters = CharacterSet.alphanumerics.union(CharacterSet.symbols)
                                                          .union(CharacterSet.punctuationCharacters)
                                                          .union(CharacterSet.whitespaces)
        let validator = TextValidator(minimumLength: 4,
                                      maximumLength: 254,
                                      allowedCharacters: allowedCharacters)
        let data = TextInputCellData(title: "loginPasswordTitleText".localized.uppercased(),
                                     placeHolder: "loginPasswordPlaceHolder".localized,
                                     text: loginCredentials.password,
                                     isSecureTextEntry: true,
                                     validator: validator)
        let configurator = TextInputCellConfigurator(data: data)
        let textFieldDidEndEditing: (String?) -> () = { [weak self, weak configurator] text in
            guard let configurator = configurator else { return }
            configurator.data.text = text
            self?.loginCredentials.password = text
            ValidationManager.validate(validableInputViewConfigurator: configurator,
                                       sectionSequence: self?.sectionSequence,
                                       tableViewInterface: self?.tableViewInterface)
        }
        configurator.data.textfieldDidEndEditing = textFieldDidEndEditing

        configurator.didBecomeFirstResponder = { [weak self] input in
            //self?.currentFirstResponderInput = input
        }

        return configurator
    }()

    private lazy var loginButtonCellConfigurator: MainButtonCellConfigurator = {
        let didPressButton: () -> () = { [weak self] in
            self?.onLoginButtonPressed?()
        }
        let buttonInsets = UIEdgeInsets(top: 24.deviceSizeAware,
                                        left: 12,
                                        bottom: -24.deviceSizeAware,
                                        right: -12)
        let data = MainButtonCellData(title: "loginButtonTitile".localized.uppercased(),
                                      buttonInsets: buttonInsets,
                                      didPressButton: didPressButton)

        return MainButtonCellConfigurator(data: data)
    }()

//    private lazy var textInputCellInputAccessoryView: UIToolbar = {
//        let toolbar = UIToolbar(
//            frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
//
//        return toolbar
//    }()

    // MARK: - Initialization

    init(tableViewInterface: TableViewControllerInterface) {
        
        self.tableViewInterface = tableViewInterface
        self.loginCredentials = LoginCredentials(username: "ghuitson0@cmu.edu", password: "tewwigz44")
    }

    //MARK: - Access methods
    
    public func buildSections() {
        var sections  = [SingleColumnSection(cellConfigurators: [loginInputCellConfigurator,
                                                                 passwordInputCellConfigurator,
                                                                 loginButtonCellConfigurator,
                                                                 ],
                                             headerConfigurator: headerConfigurator)]
        sections.append(makeAnimationFillerSection())
        sectionSequence = SectionSequence(sections: sections)
    }
    
    private func makeAnimationFillerSection() -> SingleColumnSection {
        let configurator = AnimationFillerCellConfigurator(data: AnimationFillerCellData(animationName: "plant_walking"))

        return SingleColumnSection(cellConfigurators: [configurator])
    }
    
    public func authenticate() {
        guard let username = loginCredentials.username,
            let password = loginCredentials.password else {
                return
        }
        UIAppDelegate?.showLoadingIndicator()
        Network.fetchData(query: FetchUserQuery(email: username, password: password)) { result in
            switch result {
            case .success(let success):
                if success.user.first?.name == nil {
                    self.onLoginFailure?()
                    Logger.error("JEBŁ LOGIN")
                    return
                }
                UIAppDelegate?.hideLoadingIndicator()
                guard let user = success.user.first else { return }
                self.onLoginSuccess?(user.name)
                self.defaults.set(user.id, forKey: "userId")
                self.defaults.set(true, forKey: "loggedIn")
            case .failure(let failure):
                Logger.error("ERROR: \(failure)")
                UIAppDelegate?.hideLoadingIndicator()
            }
        }
        Logger.error("AUTH")
        
        
//        UIAppDelegate?.showLoadingIndicator()
//        worker.authenticate(username: username, password: password, success: { [weak self] in
//            UIAppDelegate?.hideLoadingIndicator()
//            AnalyticsEventLogger.logEvent(with: AnalyticsEvent(name: .login))
//            self?.onLoginSuccess?()
//        }) { error in
//            UIAppDelegate?.hideLoadingIndicator()
//            DialogManager.showErrorDialog(with: error)
//        }
    }

    public func validate(completion: (([Error], [IndexPath]) -> Void)? = nil) {
        let inputs: [ValidableInputViewConfigurator] = [loginInputCellConfigurator,
                                                        passwordInputCellConfigurator]
        ValidationManager.validate(validableInputViewConfigurators: inputs,
                                   sectionSequence: sectionSequence,
                                   completion: completion)
    }

    // MARK: - Private methods
   
}
