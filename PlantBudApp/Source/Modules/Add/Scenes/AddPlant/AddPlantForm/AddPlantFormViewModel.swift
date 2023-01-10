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
        let data = TextInputCellData(title: "Plant Name".uppercased(),
                                     placeHolder: "plant Name",
                                     isSecureTextEntry: false,
                                     validator: validator)
        let configurator = TextInputCellConfigurator(data: data)
        let textFieldDidEndEditing: (String?) -> () = { [weak self, weak configurator] text in
            guard let configurator = configurator else { return }
            configurator.data.text = text
            self?.plantName = text
            Logger.info(text ?? "DEEWOsdlkjfhasdlkf")
            ValidationManager.validate(validableInputViewConfigurator: configurator,
                                       sectionSequence: self?.sectionSequence,
                                       tableViewInterface: self?.tableViewInterface)
        }
        configurator.data.textfieldDidEndEditing = textFieldDidEndEditing

//        configurator.didBecomeFirstResponder = { [weak self] input in
//            self?.currentFirstResponderInput = input
//        }

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
        let data = MainButtonCellData(title: "ADD PLANT".uppercased(),
                                      buttonInsets: buttonInsets,
                                      didPressButton: didPressButton)

        return MainButtonCellConfigurator(data: data)
    }()
    
    private func makeHelloHeaderSection() -> SingleColumnSection {
        let configurator = HelloHeaderCellConfigurator(data: TestViewCellData(title: "FORM HERE"))

        return SingleColumnSection(cellConfigurators: [configurator])
    }
    
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
    
    
    public func loadData(refresh: Bool = false) {
//        UIAppDelegate?.showLoadingIndicator()
        
//        fetchPlantsWithTypes()
    }
    
//    public func buildSections(plants: [Plant]) {
//
//
//        sectionSequence = SectionSequence(
//            sections: [
//                SingleColumnSection(cellConfigurators: cellConfigurators)
//                //                makeAddButton(),
//                //                makePlantsSection(plantDomains: plantDomains!)
//            ])
//    }
    
    public func buildEmptySections() {
        sectionSequence = SectionSequence(
            sections: [
                makeHelloHeaderSection(),
                SingleColumnSection(cellConfigurators: [plantNameInputCellConfigurator,addPlantButtonCellConfigurator])
            ])
    }
    
    public func makeAddPlantRequest(plantName: String, plantType: PlantTypeDomain) {
        UIAppDelegate?.showLoadingIndicator()
        let dispatchGroup = DispatchGroup()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let timestamp = dateFormatter.string(from: Date())
        print(timestamp)  // Output: 2022-12-11T15:43:59.337Z
        
        // Fetch data1
        dispatchGroup.enter()
        Network.shared.apollo.store.clearCache()
        Network.performMutation(mutation: AddPlantMutation(object: Plant_insert_input(
            createdAt: timestamp,
            plantName: plantName,
            plantPlacement: "default",
            plantState: "default",
            plantTypeId: plantType.id,
            updatedAt: timestamp,
            userId: UserContext.shared.userId
        ))) { result in
            switch result {
            case .success(let data):
                // Use the `data` object to access the results of the mutation
                Logger.info("TUTAJ KURWA ############################")
                Logger.info("\(data.insertPlantOne.debugDescription)")
                self.onAddPlantSuccess?()
            case .failure(let error):
                // Handle the error
                Logger.info("TUTAJ KURWA ############################")
                Logger.info("Jebło \(error)")
            }
            dispatchGroup.leave()
        }
        
        // Run a block of code when all requests are completed
        dispatchGroup.notify(queue: .main) {
//            self.loadData()
            UIAppDelegate?.hideLoadingIndicator()
        }
    }
    
    
    //MARK: - Private methods
    
    
    
    
    // MARK: - Selectors
    
}



