//
//  RegisterViewModel.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 21/01/2023.
//

import UIKit

class RegisterViewModel {
    
    //MARK: - Binding closures
    
    public var onSectionSequenceChange: ((SectionSequence) -> Void)?
    public var onRegisterButtonPressed: (() -> ())?
    public var onRegisterSuccess: ((LoginCredentials) -> ())?
    public var hideKeyboard: (() -> ())?
    public var onError: ((Error) -> ())?

    //MARK: - Private properties

    private var registerCredentials: RegisterCredentials
    private weak var tableViewInterface: TableViewControllerInterface?
    private let defaults = UserDefaults.standard
    
    private var sectionSequence: SectionSequence = SectionSequence() {
        didSet {
            onSectionSequenceChange?(sectionSequence)
        }
    }
    
    private var inputs: [InputInterface] {
        return [nameInputCellConfigurator, userNameInputCellConfigurator, emailInputCellConfigurator, passwordInputCellConfigurator]
    }
    
    // MARK: - Form items

    private lazy var headerConfigurator: AppIconHeaderCellConfigurator = {
        return AppIconHeaderCellConfigurator(data: "data")
    }()
    

    private lazy var nameInputCellConfigurator: LoginTextInputCellConfigurator = {
        let allowedCharacters = CharacterSet.alphanumerics.union(CharacterSet.symbols)
                                                          .union(CharacterSet.punctuationCharacters)
                                                          .union(CharacterSet.whitespaces)
        let data = TextInputCellData(title: "nameInputText".localized,
                                     placeHolder: "nameInputPlaceholder".localized,
                                     text: registerCredentials.name,
                                     isSecureTextEntry: false,
                                     validator: TextValidator(minimumLength: 3,
                                                              maximumLength: 254,
                                                              allowedCharacters: allowedCharacters))
        let configurator = LoginTextInputCellConfigurator(data: data)
        let textFieldDidEndEditing: (String?) -> () = { [weak self, weak configurator] text in
            guard let configurator = configurator else { return }
            configurator.data.text = text
            self?.registerCredentials.name = text
            ValidationManager.validate(validableInputViewConfigurator: configurator,
                                       sectionSequence: self?.sectionSequence,
                                       tableViewInterface: self?.tableViewInterface)
        }

        configurator.data.textfieldDidEndEditing = textFieldDidEndEditing

        configurator.didBecomeFirstResponder = { [weak self] input in
        }

        return configurator
    }()
    
    private lazy var userNameInputCellConfigurator: LoginTextInputCellConfigurator = {
        let allowedCharacters = CharacterSet.alphanumerics.union(CharacterSet.symbols)
                                                          .union(CharacterSet.punctuationCharacters)
                                                          .union(CharacterSet.whitespaces)
        let data = TextInputCellData(title: "usernameInputText".localized,
                                     placeHolder: "usernameInputPlaceholder".localized,
                                     text: registerCredentials.username,
                                     isSecureTextEntry: false,
                                     validator: TextValidator(minimumLength: 3,
                                                              maximumLength: 254,
                                                              allowedCharacters: allowedCharacters))
        let configurator = LoginTextInputCellConfigurator(data: data)
        let textFieldDidEndEditing: (String?) -> () = { [weak self, weak configurator] text in
            guard let configurator = configurator else { return }
            configurator.data.text = text
            self?.registerCredentials.username = text
            ValidationManager.validate(validableInputViewConfigurator: configurator,
                                       sectionSequence: self?.sectionSequence,
                                       tableViewInterface: self?.tableViewInterface)
        }

        configurator.data.textfieldDidEndEditing = textFieldDidEndEditing

        configurator.didBecomeFirstResponder = { [weak self] input in
        }

        return configurator
    }()
    
    private lazy var emailInputCellConfigurator: LoginTextInputCellConfigurator = {
        let allowedCharacters = CharacterSet.alphanumerics.union(CharacterSet.symbols)
                                                          .union(CharacterSet.punctuationCharacters)
        let data = TextInputCellData(title: "emailInputText".localized,
                                     placeHolder: "emailInputPlaceholder".localized,
                                     text: registerCredentials.email,
                                     isSecureTextEntry: false,
                                     validator: TextValidator(minimumLength: 3,
                                                              maximumLength: 254,
                                                              allowedCharacters: allowedCharacters))
        let configurator = LoginTextInputCellConfigurator(data: data)
        let textFieldDidEndEditing: (String?) -> () = { [weak self, weak configurator] text in
            guard let configurator = configurator else { return }
            configurator.data.text = text
            self?.registerCredentials.email = text
            ValidationManager.validate(validableInputViewConfigurator: configurator,
                                       sectionSequence: self?.sectionSequence,
                                       tableViewInterface: self?.tableViewInterface)
        }

        configurator.data.textfieldDidEndEditing = textFieldDidEndEditing

        configurator.didBecomeFirstResponder = { [weak self] input in
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
        let data = TextInputCellData(title: "passwordInputText".localized,
                                     placeHolder: "passwordPlaceholder".localized,
                                     text: registerCredentials.password,
                                     isSecureTextEntry: true,
                                     validator: validator)
        let configurator = TextInputCellConfigurator(data: data)
        let textFieldDidEndEditing: (String?) -> () = { [weak self, weak configurator] text in
            guard let configurator = configurator else { return }
            configurator.data.text = text
            self?.registerCredentials.password = text
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
    
    private lazy var registerButtonCellConfigurator: MainButtonCellConfigurator = {
        let didPressButton: () -> () = { [weak self] in
            self?.register()
            Logger.error("REGISTER")
        }
        let buttonInsets = UIEdgeInsets(top: 0,
                                        left: 12,
                                        bottom: -24.deviceSizeAware,
                                        right: -12)
        let data = MainButtonCellData(title: "Register",
                                      buttonInsets: buttonInsets,
                                      didPressButton: didPressButton)

        return MainButtonCellConfigurator(data: data)
    }()

    // MARK: - Initialization

    init(tableViewInterface: TableViewControllerInterface) {
        
        self.tableViewInterface = tableViewInterface
        self.registerCredentials = RegisterCredentials(name: "test",username: "test", email: "test@test.pl", password: "test")
    }

    //MARK: - Access methods
    
    public func buildSections() {
        var sections  = [SingleColumnSection(cellConfigurators: [nameInputCellConfigurator,
                                                                 userNameInputCellConfigurator,
                                                                 emailInputCellConfigurator,
                                                                 passwordInputCellConfigurator,
                                                                 registerButtonCellConfigurator],
                                             headerConfigurator: headerConfigurator)]
        sections.append(makeAnimationFillerSection())
        sectionSequence = SectionSequence(sections: sections)
    }
    
    private func makeAnimationFillerSection() -> SingleColumnSection {
        let configurator = AnimationFillerCellConfigurator(data: AnimationFillerCellData(animationName: "plant_walking"))

        return SingleColumnSection(cellConfigurators: [configurator])
    }
    
    public func register() {
        guard
            let name = registerCredentials.name,
            let username = registerCredentials.username,
            let password = registerCredentials.password,
            let email = registerCredentials.email
        else {
            return
        }
        let dispatchGroup = DispatchGroup()
        
        UIAppDelegate?.showLoadingIndicator()
        dispatchGroup.enter()
        Network.performMutation(mutation: RegisterUserMutation(
            userInput: User_insert_input(
                email: email,
                name: name,
                password: password,
                userName: username
            ))) { result in
                switch result {
                case .success(let success):
                    Logger.info("USER REGISTERED: \(success.insertUserOne.debugDescription)")
                    self.onRegisterSuccess?(LoginCredentials(username: username, password: password))
                case .failure(let failure):
                    Logger.error(failure.localizedDescription)
                }
                dispatchGroup.leave()
            }
        
        
        dispatchGroup.notify(queue: .main) {
            UIAppDelegate?.hideLoadingIndicator()
        }
    }

    public func validate(completion: (([Error], [IndexPath]) -> Void)? = nil) {
        let inputs: [ValidableInputViewConfigurator] = [nameInputCellConfigurator,
                                                        passwordInputCellConfigurator]
        ValidationManager.validate(validableInputViewConfigurators: inputs,
                                   sectionSequence: sectionSequence,
                                   completion: completion)
    }

    // MARK: - Private methods
   
}

