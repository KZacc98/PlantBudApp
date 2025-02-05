//
//  AddPlantFormViewModel.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 08/01/2023.
//

import UIKit

final class AddPlantFormViewModel {
    
    //MARK: - Binding closures
    
    public var onSectionSequenceChange: ((SectionSequence) -> Void)?
    public var onAddPlantSuccess: (() -> Void)?
    public var onAddPlantPressed: (() -> Void)?
    public var onAddPlantRequestButtonPressed: ((String, PlantTypeDomain) -> Void)?
    public var onError: ((Error) -> ())?
    
    //MARK: Private properties
    
    private var sectionSequence: SectionSequence = SectionSequence() {
        didSet {
            onSectionSequenceChange?(sectionSequence)
        }
    }
    private let defaults = UserDefaults.standard
    private var plantName: String?
    private var plantTypeDomain: PlantTypeDomain
    private weak var tableViewInterface: TableViewControllerInterface?
    
    let placeholder = "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png"
    
    private lazy var plantNameInputCellConfigurator: TextInputCellConfigurator = {
        let allowedCharacters = CharacterSet.alphanumerics.union(CharacterSet.symbols)
                                                          .union(CharacterSet.punctuationCharacters)
                                                          .union(CharacterSet.whitespaces)
        let validator = TextValidator(minimumLength: 4,
                                      maximumLength: 254,
                                      allowedCharacters: allowedCharacters)
        let data = TextInputCellData(title: "plantNameInput".localized.uppercased(),
                                     placeHolder: "plantNameInput".localized,
                                     isSecureTextEntry: false,
                                     validator: validator)
        let configurator = TextInputCellConfigurator(data: data)
        let textFieldDidEndEditing: (String?) -> () = { [weak self, weak configurator] text in
            guard let configurator = configurator else { return }
            configurator.data.text = text
            self?.plantName = text
            Logger.info(text ?? "")
            ValidationManager.validate(validableInputViewConfigurator: configurator,
                                       sectionSequence: self?.sectionSequence,
                                       tableViewInterface: self?.tableViewInterface)
        }
        configurator.data.textfieldDidEndEditing = textFieldDidEndEditing

        return configurator
    }()
    
    private lazy var addPlantButtonCellConfigurator: MainButtonCellConfigurator = {
        let didPressButton: () -> () = { [weak self] in
            Logger.info("ADD PRESSED")
            guard let plantName = self?.plantName, let plantType = self?.plantTypeDomain else { return }
            self?.onAddPlantRequestButtonPressed?(plantName, plantType)
        
        }
        let buttonInsets = UIEdgeInsets(top: 24.deviceSizeAware,
                                        left: 12,
                                        bottom: -24.deviceSizeAware,
                                        right: -12)
        let data = MainButtonCellData(title: "addPlantButtonTitle".localized,
                                      buttonInsets: buttonInsets,
                                      didPressButton: didPressButton)

        return MainButtonCellConfigurator(data: data)
    }()
    
    //MARK: - Initialization

    init(plantType: PlantTypeDomain,
         tableViewInterface: TableViewControllerInterface
    ) {
        self.plantTypeDomain = plantType
        self.tableViewInterface = tableViewInterface
    }
    
    
    //MARK: - Access methods
    
    public func validate(completion: (([Error], [IndexPath]) -> Void)? = nil) {
        let inputs: [ValidableInputViewConfigurator] = [plantNameInputCellConfigurator]
        ValidationManager.validate(validableInputViewConfigurators: inputs,
                                   sectionSequence: sectionSequence,
                                   completion: completion)
    }
    
    public func buildEmptySections() {
        sectionSequence = SectionSequence(
            sections: [
                SingleColumnSection(cellConfigurators: [plantNameInputCellConfigurator,addPlantButtonCellConfigurator])
            ])
    }
    
    public func makeAddPlantRequest(plantName: String, plantType: PlantTypeDomain) {
        UIAppDelegate?.showLoadingIndicator()
        let dispatchGroup = DispatchGroup()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let timestamp = dateFormatter.string(from: Date())
        
        dispatchGroup.enter()
        Network.shared.apollo.store.clearCache()
        Network.performMutation(mutation: AddPlantMutation(object: Plant_insert_input(
            createdAt: timestamp,
            plantImage: plantType.plantTypeImage,
            plantName: plantName,
            plantPlacement: "default",
            plantState: "default",
            plantTypeId: plantType.id,
            updatedAt: timestamp,
            userId: defaults.integer(forKey: "userId")
        ))) { result in
            switch result {
            case .success(let data):
                Logger.info("\(data.insertPlantOne.debugDescription)")
                self.onAddPlantSuccess?()
            case .failure(let error):
                Logger.error("error \(error)")
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            UIAppDelegate?.hideLoadingIndicator()
        }
    }
}
