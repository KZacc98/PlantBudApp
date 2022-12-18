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
    
    private var plant: PlantDomain
    private var careRoutineDomain: CareRoutineDomain? {
        didSet{
            UIAppDelegate?.hideLoadingIndicator()
            buildSections(steps: routineSteps)
        }
    }
    private var careRoutines: CareRoutine?
    
    private var routineSteps: [RoutineStepDomain]? {
        didSet{
            buildSections(steps: routineSteps)
        }
    }

    
    
    
    //MARK: - Initialization
    
    init(plant: PlantDomain) {
        self.plant = plant
    }
    
    func fetchData() {
        let dispatchGroup = DispatchGroup()
        var careRoutineDomain: CareRoutineDomain?
        var routineSteps: [RoutineStepDomain]?
        var careRoutine: CareRoutine

        // Fetch data1
        dispatchGroup.enter()
        Network.fetchData(query: FetchPlantCareRoutineQuery(plantId: plant.id)) { result in
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
                }
                dispatchGroup.leave()
            }
            
        }
    }
    
    //MARK: - Access methods
    
    public func loadData(refresh: Bool = false) {
        UIAppDelegate?.showLoadingIndicator()

        Logger.info("\(plant.id)")
        
//        Task {
//            do {
//                self.careRoutineDomain = try await Network.fetchData(query: FetchPlantCareRoutineQuery(plantId: plant.id)).careRoutine.first.map({ res in
//                    CareRoutineDomain(remote: CareRoutineRemote(
//                        id: res.id,
//                        plantId: res.plantId,
//                        isActive: res.isActive,
//                        isCompleted: res.isCompleted,
//                        isShared: res.isShared,
//                        flag: res.flag,
//                        createdAt: res.createdAt,
//                        updatedAt: res.updatedAt
//                    ))
//                })
//                await UIAppDelegate?.hideLoadingIndicator()
//            } catch {
//                await UIAppDelegate?.hideLoadingIndicator()
//                Logger.error(error.localizedDescription)
//            }
//        }
        
        fetchData()
    }
    
    public func buildSections(steps: [RoutineStepDomain]?) {
        if let routineSteps = steps {
            let cellConfigurators = routineSteps.map {
                HelloHeaderCellConfigurator(data: makeTestCellData(steps: $0))
            }
            sectionSequence = SectionSequence(
                sections: [
                    SingleColumnSection(cellConfigurators: cellConfigurators),
                    makePlantCountSection()
                ])
        } else {
            sectionSequence = SectionSequence(
                sections: [
                    makePlantCountSection()
                ])
        }
        
        
    }
    
    //MARK: - Private methods
    
    private func makePlantCountSection() -> SingleColumnSection {
        let configurator = HelloHeaderCellConfigurator(data: TestViewCellData(title: "PlantName: \(plant.plantName)"))
        
        return SingleColumnSection(cellConfigurators: [configurator])
        
    }
    
    private func makeTestCellData(steps: RoutineStepDomain) -> TestViewCellData {
        let data = TestViewCellData(title: steps.description)
        
        return data
    }
    
    // MARK: - Selectors
    
}


