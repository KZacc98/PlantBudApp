//
//  PlantDetailsViewModel.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 16/12/2022.
//

import UIKit

final class PlantDetailsViewModel {
    
    //MARK: - Binding closures
    
    public var onSectionSequenceChange: ((SectionSequence) -> Void)?
    public var onFetchSuccess: ((String) -> Void)?
    public var onDeletePlantSuccess: (() -> Void)?
    public var onAddCareRoutinePressed: ((Int, Bool) -> Void)?
    public var onError: ((Error) -> ())?
    
    //MARK: Private properties
    
    private var sectionSequence: SectionSequence = SectionSequence() {
        didSet {
            onSectionSequenceChange?(sectionSequence)
        }
    }
    
    private var plant: Plant
    private var careRoutineDomain: CareRoutineDomain? {
        didSet{
            UIAppDelegate?.hideLoadingIndicator()
            //buildSections(steps: routineSteps)
        }
    }
    private var careRoutine: CareRoutine? {
        didSet{
            UIAppDelegate?.hideLoadingIndicator()
            buildSections(steps: careRoutine?.routineSteps)
        }
    }
    
    var routineSteps: [RoutineStepDomain]? {
        didSet{
            guard let careRoutineDomain = careRoutineDomain, let routineSteps = routineSteps
            else { return }
            self.careRoutine = makeCareRoutine(plant: plant.plantData, careRoutine: careRoutineDomain, routineSteps: routineSteps)
        }
    }
    
    
    
    //MARK: - Initialization
    
    init(plant: Plant) {
        self.plant = plant
    }
    
    func fetchData() {
        let dispatchGroup = DispatchGroup()
        var careRoutineDomain: CareRoutineDomain?

        // Fetch data1
        Network.shared.apollo.store.clearCache()
        dispatchGroup.enter()
        Network.fetchData(query: FetchPlantCareRoutineQuery(plantId: plant.plantData.id)) { result in
            switch result {
            case .success(let data):
                careRoutineDomain = data.careRoutine.first.map({ res in
                    CareRoutineDomain(remote: CareRoutineRemote(
                        id: res.id,
                        plantId: res.plantId,
                        isActive: res.isActive,
                        isCompleted: res.isCompleted,
                        isShared: res.isShared,
                        flag: res.flag,
                        createdAt: res.createdAt,
                        updatedAt: res.updatedAt
                    ))
                })
            case .failure(let error):
                Logger.error(error.localizedDescription)
            }
            dispatchGroup.leave()
        }

        // Run a block of code when all requests are completed
        dispatchGroup.notify(queue: .main) {

            self.careRoutineDomain = careRoutineDomain
            dispatchGroup.enter()
            Network.fetchData(query: FetchCareRoutineStepsQuery(careRoutineId: careRoutineDomain?.id) ) { result in
                switch result {
                case .success(let data):
                    self.routineSteps = data.routineStep.map({ res in
                        RoutineStepDomain(remote: RoutineStepRemote(
                            id: res.id,
                            careRoutineId: res.careRoutineId,
                            stepFrequency: res.stepFrequency,
                            otherFrequency: res.otherFrequency,
                            description: res.description,
                            isCompleted: res.isCompleted,
                            completedAt: res.completedAt,
                            createdAt: res.createdAt,
                            updatedAt: res.updatedAt
                        ))
                    })
                case .failure(let error):
                    Logger.error(error.localizedDescription)
                    self.buildEmptySections()
                    
                }
                dispatchGroup.leave()
            }
        }
    }
    
    func makeCareRoutine(plant: PlantDomain, careRoutine: CareRoutineDomain, routineSteps: [RoutineStepDomain]) -> CareRoutine {
        return CareRoutine(
            careRoutineId: careRoutine.id,
            plantId: plant.id,
            isActive: careRoutine.isActive,
            isCompleted: careRoutine.isCompleted,
            isShared: careRoutine.isShared,
            flag: careRoutine.flag,
            routineSteps: routineSteps,
            createdAt: careRoutine.createdAt,
            updatedAt: careRoutine.updatedAt
        )
    }
    
    //MARK: - Access methods
    
    public func loadData(refresh: Bool = false) {
        UIAppDelegate?.showLoadingIndicator()

        Logger.info("\(plant)")
        
        fetchData()
    }
    
    private lazy var deletePlantButtonCellConfigurator: MainButtonCellConfigurator = {
        let didPressButton: () -> () = { [weak self] in
            DialogManager.showConfirmationDialog(
                title: "warning".localized,
                message: "deletePlantDialogMessage".localized,
                cancelButtonTitle: "no".localized,
                otherButtonTitles: ["yes".localized],
                acceptBlock: {
                    guard let plant = self?.plant, let careRoutineId = self?.careRoutine?.careRoutineId else { return }
                    self?.deletePlant(plant: plant, careRoutineId: careRoutineId)
                },
                rejectBlock: {}
            )
            
        }
        let buttonInsets = UIEdgeInsets(top: 24.deviceSizeAware,
                                        left: 12,
                                        bottom: -24.deviceSizeAware,
                                        right: -12)
        let data = MainButtonCellData(title: "deletePlantButtonTitle".localized,
                                      buttonInsets: buttonInsets,
                                      didPressButton: didPressButton)
        
        return MainButtonCellConfigurator(data: data)
    }()
    
    private lazy var addCareRoutineButtonCellConfigurator: MainButtonCellConfigurator = {
        let didPressButton: () -> () = { [weak self] in
            Logger.info("ADD ROUTINE PRESSED")
            guard let self = self else { return }
            if self.routineSteps != nil {
                self.onAddCareRoutinePressed?(self.plant.plantData.id, true)
            } else {
                self.onAddCareRoutinePressed?(self.plant.plantData.id, false)
            }
            
        }
        let buttonInsets = UIEdgeInsets(top: 24.deviceSizeAware,
                                        left: 12,
                                        bottom: -24.deviceSizeAware,
                                        right: -12)
        let data = MainButtonCellData(title: self.routineSteps != nil ? "addRoutineStepButtonLabel".localized : "addCareRoutineButtonLabel".localized,
                                      buttonInsets: buttonInsets,
                                      didPressButton: didPressButton)
        
        return MainButtonCellConfigurator(data: data)
    }()
    
    private func deletePlant(plant: Plant, careRoutineId: Int) {
        let dispatchGroup = DispatchGroup()
        UIAppDelegate?.showLoadingIndicator()
        
        Network.shared.apollo.store.clearCache()
        dispatchGroup.enter()
        Network.performMutation(mutation: DeleteCareRoutineMutation(
            careRoutineId: careRoutineId,
            plantId: plant.plantData.id)) { result in
                switch result {
                case .success(let success):
                    Logger.info(success.deleteRoutineStep.debugDescription)
                    Logger.info(success.deleteCareRoutine.debugDescription)
                case .failure(let failure):
                    Logger.error(failure.localizedDescription)
                }
                dispatchGroup.leave()
            }
        
        // Run a block of code when all requests are completed
        dispatchGroup.notify(queue: .main) {
            Network.performMutation(mutation: DeletePlantMutation(_eq: plant.plantData.id)) { result in
                switch result {
                case .success(let data):
                    Logger.info(data.deletePlant.debugDescription)
                    UIAppDelegate?.hideLoadingIndicator()
                    self.onDeletePlantSuccess?()
                case .failure(let error):
                    Logger.error(error.localizedDescription)
                    DialogManager.showErrorDialog(with: error)
                    UIAppDelegate?.hideLoadingIndicator()
                }
                
            }
        }
    }
    
    public func buildSections(steps: [RoutineStepDomain]?) {
        guard let routineSteps = steps else { return }
        let cellConfigurators = routineSteps.map {
            RoutineStepCellConfigurator(data: makeRoutineStepCellData(step: $0))
        }
        let headerCellConfigurator = PlantDetailsHeaderCellConfigurator(data: makePlantDetailsCellData(plant: self.plant))
        
        let typeInfoCellConfigurator = PlantDetailsTypeInfoCellConfigurator(data: makePlantDetailsTypeInfoCellData(plant: self.plant))
        
        let headerData = MainSectionHeaderData(
            title: "careRoutineHeaderLabel".localized, insets: UIEdgeInsets(top: 0, left: 0, bottom: -2, right: 0))
        let headerConfigurator = MainSectionHeaderConfigurator(data: headerData)
        
        let deleteHeaderData = MainSectionHeaderData(
            title: "deleteHeaderLabel".localized, insets: UIEdgeInsets(top: 0, left: 0, bottom: -2, right: 0))
        let deleteHeaderConfigurator = MainSectionHeaderConfigurator(data: deleteHeaderData)
        sectionSequence = SectionSequence(
            sections: [
                SingleColumnSection(cellConfigurators: [headerCellConfigurator]),
                SingleColumnSection(cellConfigurators: [typeInfoCellConfigurator]),
                SingleColumnSection(cellConfigurators: cellConfigurators, headerConfigurator: headerConfigurator),
                SingleColumnSection(cellConfigurators: [addCareRoutineButtonCellConfigurator]),
                SingleColumnSection(cellConfigurators: [deletePlantButtonCellConfigurator], headerConfigurator: deleteHeaderConfigurator)
            ]
        )
    }
    
    public func buildEmptySections() { //TODO: SPrawdz czy tego w ogole jeszcze uzywasz
        let headerCellConfigurator = PlantDetailsHeaderCellConfigurator(data: makePlantDetailsCellData(plant: self.plant))
        
        let typeInfoCellConfigurator = PlantDetailsTypeInfoCellConfigurator(data: makePlantDetailsTypeInfoCellData(plant: self.plant))
        
        let headerData = MainSectionHeaderData(
            title: "careRoutineHeaderLabel".localized, insets: UIEdgeInsets(top: 0, left: 0, bottom: -2, right: 0))
        let headerConfigurator = MainSectionHeaderConfigurator(data: headerData)
        
        let deleteHeaderData = MainSectionHeaderData(
            title: "deleteHeaderLabel".localized, insets: UIEdgeInsets(top: 0, left: 0, bottom: -2, right: 0))
        let deleteHeaderConfigurator = MainSectionHeaderConfigurator(data: deleteHeaderData)
        sectionSequence = SectionSequence(
            sections: [
                SingleColumnSection(cellConfigurators: [headerCellConfigurator]),
                SingleColumnSection(cellConfigurators: [typeInfoCellConfigurator]),
                SingleColumnSection(cellConfigurators: [], headerConfigurator: headerConfigurator),
                SingleColumnSection(cellConfigurators: [addCareRoutineButtonCellConfigurator]),
                SingleColumnSection(cellConfigurators: [deletePlantButtonCellConfigurator], headerConfigurator: deleteHeaderConfigurator)
            ]
        )
    }
    
    //MARK: - Private methods
    
    private func makeRoutineStepCellData(step: RoutineStepDomain) -> RoutineStepCellData {
        let didPressCheckbox: () -> Void = { [weak self] in
            UIAppDelegate?.showLoadingIndicator()
            Logger.info("TAP")
            self?.setCheckbox(steps: step)

        }
        
        let didHoldCell: () -> Void = { [weak self] in
            DialogManager.showConfirmationDialog(message: "test edit")
        }
        
        let data = RoutineStepCellData(step: step, didPressCheckbox: didPressCheckbox, didHoldCell: didHoldCell)
        
        return data
    }
    
    private func makePlantDetailsCellData(plant: Plant) -> PlantDetailsCellData {
        let didTapPlant: () -> Void = {
            Logger.info("TAP")
        }
        
        let data = PlantDetailsCellData(
            imageUrl: URL(string: plant.plantData.plantImage) ?? URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png")!,
            plantName: plant.plantData.plantName,
            plantState: PlantState(rawValue: plant.plantData.plantState.rawValue) ?? .default,
            plantType: plant.plantTypeData,
            didTapPlant: didTapPlant)
        
        return data
    }
    
    private func makePlantDetailsTypeInfoCellData(plant: Plant) -> PlantDetailsTypeInfoCellData {
        let didTapPlant: () -> Void = {
            Logger.info("TAP")
        }
        
        let data = PlantDetailsTypeInfoCellData(
            imageUrl: (URL(string: plant.plantTypeData.plantTypeImage) ?? URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png"))! ,
            plantType: plant.plantTypeData,
            didTapPlant: didTapPlant
        )
        
        return data
    }
    
    func prepareSteps(steps: [RoutineStepDomain]){
        let currentDate = Date()
        let filteredArray = steps.filter { $0.completedAt.addingTimeInterval(TimeInterval($0.stepFrequency.days * 24 * 60 * 60)) <= currentDate }
        let ids = filteredArray.map { $0.id }
        let dispatchGroup = DispatchGroup()
        // Fetch data1
        dispatchGroup.enter()
        Network.shared.apollo.store.clearCache()
        Network.performMutation(mutation: UpdateRoutineStepStatusMutation(_in: ids, isCompleted: false)) { result in
            switch result {
            case .success(let success):
                Logger.info(success.jsonObject.debugDescription)
            case .failure(let failure):
                Logger.error(failure.localizedDescription)
            }
            dispatchGroup.leave()
        }
        
        // Run a block of code when all requests are completed
        dispatchGroup.notify(queue: .main) {
            self.loadData()
        }
        
    }
    
    private func setCheckbox(steps: RoutineStepDomain) {
        let dispatchGroup = DispatchGroup()
        let timestamp = Network.getTimestamp()
        // Fetch data1
        dispatchGroup.enter()
        Network.shared.apollo.store.clearCache()
        Network.performMutation(mutation: CareRoutineStepUpdateMutation(stepId: steps.id, _set: RoutineStep_set_input(completedAt: timestamp, isCompleted: !steps.isCompleted, updatedAt: timestamp))) { result in
            switch result {
            case .success(let data):
                // Use the `data` object to access the results of the mutation
                Logger.info(data.updateRoutineStep.debugDescription)
            case .failure(let error):
                // Handle the error
                Logger.info(error.localizedDescription)
            }
            dispatchGroup.leave()
        }
        
        // Run a block of code when all requests are completed
        dispatchGroup.notify(queue: .main) {
            self.loadData()
        }
    }
    
    // MARK: - Selectors
    
}


