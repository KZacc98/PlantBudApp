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
    
    private var routineSteps: [RoutineStepDomain]? {
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
        var routineSteps: [RoutineStepDomain]?

        // Fetch data1
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
                Logger.error("ERROR: \(error)")
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
                    Logger.error("ERROR: \(error)")
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
    
    public func buildSections(steps: [RoutineStepDomain]?) {
        guard let routineSteps = steps else { return }
        let cellConfigurators = routineSteps.map {
            RoutineStepCellConfigurator(data: makeRoutineStepCellData(steps: $0))
        }
        let headerCellConfigurator = PlantDetailsHeaderCellConfigurator(data: makePlantDetailsCellData(plant: self.plant))
        
        let typeInfoCellConfigurator = PlantDetailsTypeInfoCellConfigurator(data: makePlantDetailsTypeInfoCellData(plant: self.plant))
        
        let headerData = MainSectionHeaderData(
            title: "CareRoutine", insets: UIEdgeInsets(top: 0, left: 0, bottom: -2, right: 0))
        let headerConfigurator = MainSectionHeaderConfigurator(data: headerData)
        sectionSequence = SectionSequence(
            sections: [
                SingleColumnSection(cellConfigurators: [headerCellConfigurator]),
                SingleColumnSection(cellConfigurators: [typeInfoCellConfigurator]),
                SingleColumnSection(cellConfigurators: cellConfigurators, headerConfigurator: headerConfigurator)
            ]
        )
        
        
        
    }
    
    public func buildEmptySections() {
        let headerCellConfigurator = PlantDetailsHeaderCellConfigurator(data: makePlantDetailsCellData(plant: self.plant))
        
        let typeInfoCellConfigurator = PlantDetailsTypeInfoCellConfigurator(data: makePlantDetailsTypeInfoCellData(plant: self.plant))
        
        let headerData = MainSectionHeaderData(
            title: "CareRoutine", insets: UIEdgeInsets(top: 0, left: 0, bottom: -2, right: 0))
        let headerConfigurator = MainSectionHeaderConfigurator(data: headerData)
        sectionSequence = SectionSequence(
            sections: [
                SingleColumnSection(cellConfigurators: [headerCellConfigurator]),
                SingleColumnSection(cellConfigurators: [typeInfoCellConfigurator]),
                SingleColumnSection(cellConfigurators: [], headerConfigurator: headerConfigurator),
                makeEmptyDataSection()
            ]
        )
    }
    
    //MARK: - Private methods
    
    private func makeEmptyDataSection() -> SingleColumnSection {
        let configurator = HelloHeaderCellConfigurator(data: TestViewCellData(title: "NO DATA"))
        
        return SingleColumnSection(cellConfigurators: [configurator])
        
    }
    
    private func makeRoutineStepCellData(steps: RoutineStepDomain) -> RoutineStepCellData {
        let didPressCheckbox: () -> Void = { [weak self] in
            UIAppDelegate?.showLoadingIndicator()
            Logger.info("TAP")
            self?.setCheckbox(steps: steps)

        }
        
        let data = RoutineStepCellData(title: steps.description, didPressCheckbox: didPressCheckbox, check: steps.isCompleted)
        
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
            imageUrl: URL(string: "https://cdn.shopify.com/s/files/1/0330/4233/3835/products/5.0-MONSTERAADANSONII_MONKEYMASK_O12CM.jpg?v=1657546105") ?? URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png")!,
            plantType: plant.plantTypeData,
            didTapPlant: didTapPlant
        )
        
        return data
    }
    
    private func setCheckbox(steps: RoutineStepDomain) {
        let dispatchGroup = DispatchGroup()
        
        // Fetch data1
        dispatchGroup.enter()
        Network.shared.apollo.store.clearCache()
        Network.performMutation(mutation: CareRoutineStepUpdateMutation(stepId: steps.id, _set: RoutineStep_set_input(isCompleted: !steps.isCompleted))) { result in
            switch result {
            case .success(let data):
                // Use the `data` object to access the results of the mutation
                Logger.info("TUTAJ KURWA ############################")
                Logger.info("\(data.updateRoutineStep.debugDescription)")
            case .failure(let error):
                // Handle the error
                Logger.info("TUTAJ KURWA ############################")
                Logger.info("Jebło \(error)")
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


