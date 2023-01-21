//
//  AddCareRoutineViewModel.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 08/01/2023.
//

import UIKit

final class AddCareRoutineViewModel {
    
    //MARK: - Binding closures
    
    public var onSectionSequenceChange: ((SectionSequence) -> Void)?
    public var onRoutineAdded: (() -> Void)?
    public var onAddPlantPressed: (() -> Void)?
    public var onAddCareRoutinePressed: (() -> Void)?
    public var onError: ((Error) -> ())?
    
    public var onFrequencyListShouldBeginEditing: (() -> (Bool))?
    public var onFrequencySelected: ((StepFrequency) -> ())?
    
    public var hideKeyboard: (() -> ())?
    
    //MARK: Private properties
    
    private var sectionSequence: SectionSequence = SectionSequence() {
        didSet {
            onSectionSequenceChange?(sectionSequence)
        }
    }
    
    private var frequencyDictionary: [StepFrequency: Bool] = [
        .daily : false,
        .weekly : false,
        .everyTwoWeeks: false,
        .everyThreeWeeks: false,
        .onceAMonth : false
    ]
    
    private var stepDescription: String?
    private var plantId: Int
    private var appendStep: Bool
    
    let placeholder = "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png"
    
    //MARK: - Initialization
    
    init(plantId: Int, appendStep: Bool){
        self.plantId = plantId
        self.appendStep = appendStep
    }
    
    
    //MARK: - Access methods
    
    public func makeStepInputSection() -> SingleColumnSection {
        let didPressAddStep: (String?) -> Void = { [weak self] text in
            guard let self = self, let stepDescription = text else { return }
            let frequency = self.frequencyDictionary.first(where: { dict in
                dict.value == true
            })?.key.rawValue ?? "everyTwoWeeks"
            if self.appendStep == false {
                self.addRoutine(plantId: self.plantId, stepDescription: stepDescription, frequency: frequency)
            } else {
                self.addRoutineStep(plantId: self.plantId, stepDescription: stepDescription, frequency: frequency)
            }
            
        }
        
        let commentCellData = AddRoutineStepCellData(
            text: "Description...",
            textViewHeight: 75.deviceSizeAware,
            maximumCommentTextLength: 499,
            returnTypeKey: .done,
            didPressAddStep: didPressAddStep,
            textViewDidChange: {text in Logger.error("\(text)")},
            textViewDidEndEditing: {text in Logger.error("EDITING END \(text)")},
            textViewShouldChangeInRange: makeTextViewShouldChangeInRange(commentTextLenght: 499))
        let commentCellConfigurator = AddRoutineStepCellConfigurator(data: commentCellData)
        
        return SingleColumnSection(cellConfigurators: [commentCellConfigurator])
    }
    
    public func makePickerCell() -> SingleColumnSection {
        let configurator = StepFrequencyPickerCellConfigurator(data: StepFrequencyPickerCellData(
            didPressDailyButton: {self.setFrequencyValue(for: .daily)},
            didPressWeeklyButton: {self.setFrequencyValue(for: .weekly)},
            didPressMonthlyButton: {self.setFrequencyValue(for: .onceAMonth)}
        ))
        
        return SingleColumnSection(cellConfigurators: [configurator])
    }
    
    func setFrequencyValue(for case: StepFrequency) {
        for (key, _) in frequencyDictionary {
            frequencyDictionary[key] = key == `case`
        }
    }
    
    public func makeTextViewShouldChangeInRange(commentTextLenght: Int) -> (UITextView, NSRange, String) -> (Bool) {
        return { textView, range, text in
            if text == "\n" {
                textView.resignFirstResponder()
                return false
            }
            
            let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
            let numberOfCharacters = newText.count
            
            return numberOfCharacters < commentTextLenght
        }
    }
    
    // MARK: UIPicker
    
    public lazy var frequencyPickerViewDelegate: FrequencyPickerDelegate = {
        let pickerDelegate = FrequencyPickerDelegate(frequencyList: [
            .daily,
            .weekly,
            .everyTwoWeeks,
            .everyThreeWeeks,
            .onceAMonth
        ])
        
        return pickerDelegate
    }()
    
    public lazy var frequencyPickerView: UIPickerView = {
        let pickerView = FormPickerView()
        pickerView.delegate = frequencyPickerViewDelegate
        pickerView.dataSource = frequencyPickerViewDelegate
        pickerView.backgroundColor = Color.brandWhite
        return pickerView
    }()
    
    public var toolbar: UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.tintColor = Color.brandGreen
        toolbar.barTintColor = Color.brandWhite
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                          target: nil,
                                          action: nil)
        
        let doneButton = UIBarButtonItem(title: "Done".localized,
                                         style: .plain,
                                         target: self,
                                         action: #selector(didTapDone(sender:)))
        toolbar.setItems([spaceButton, doneButton], animated: false)
        
        return toolbar
    }

    public lazy var frequencyPickerInputCellConfigurator: PickerInputCellConfigurator = {
        let data = PickerInputCellData(title: "Pick step frqequency",
                                       placeholder: "Step frequency",
                                       inputView: frequencyPickerView,
                                       toolbar: toolbar,
                                       returnKey: .done,
                                       text: nil,
                                       isCompact: true)
        let cellConfigurator = PickerInputCellConfigurator(data: data)
        
        cellConfigurator.data.textFieldShouldBeginEditing = { [weak self, weak cellConfigurator] _ in
            guard let shouldBegin = self?.onFrequencyListShouldBeginEditing?(), shouldBegin == true else {
                DialogManager.showInformationDialog(message: "step frequency list empty")
                return false
            }
            
            cellConfigurator?.data.isCompact = false
            cellConfigurator?.data.refreshCompact?()
            
            return shouldBegin
        }
        
        cellConfigurator.data.textFieldShouldChangeCharactersIn = { _, _, _ in
            return false
        }
        
        cellConfigurator.data.textFieldDidEndEditing = { [weak cellConfigurator] _ in
            guard let configurator = cellConfigurator else { return }
            configurator.data.isCompact = true
            configurator.data.refreshCompact?()
        }
        
        frequencyPickerViewDelegate.didSelectFrequency = { [weak self, weak cellConfigurator] frequencyList in
            guard let configurator = cellConfigurator else { return }
            configurator.data.text = frequencyList.displayName
            configurator.data.refreshTextField?()
            self?.onFrequencySelected?(frequencyList)
            self?.setFrequencyValue(for: frequencyList)
        }
        
        return cellConfigurator
    }()
    
    
    
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
    
    func addRoutine(plantId: Int, stepDescription: String, frequency: String) {
        UIAppDelegate?.showLoadingIndicator()
        let dispatchGroup = DispatchGroup()
        var careRoutineId: Int?

        
        // Fetch data1
        dispatchGroup.enter()
        Network.performMutation(mutation: CreateCareRoutineMutation(plantId: plantId)) { result in
            switch result {
            case .success(let success):
                careRoutineId = success.insertCareRoutineOne?.id
            case .failure(let failure):
                Logger.error("\(failure)")
            }
            dispatchGroup.leave()
        }
        
        // Run a block of code when all requests are completed
        dispatchGroup.notify(queue: .main) {
            guard let careRoutineId = careRoutineId else { return }
            let timestamp = Network.getTimestamp()
            Network.performMutation(mutation: AddRoutineStepMutation(input: RoutineStep_insert_input(
                careRoutineId: careRoutineId,
                completedAt: timestamp,
                description: stepDescription,
                stepFrequency: frequency,
                updatedAt: timestamp
            ))) { result in
                switch result {
                case .success(let success):
//                    careRoutineId = success.insertCareRoutineOne?.id
                    Logger.info("\(success.insertRoutineStepOne?.description)")
                    self.onRoutineAdded?()
                    UIAppDelegate?.hideLoadingIndicator()
                case .failure(let failure):
                    Logger.error("\(failure)")
                }
                
            }
        }

    }
    
    func addRoutineStep(plantId: Int, stepDescription: String, frequency: String) {
        UIAppDelegate?.showLoadingIndicator()
        let dispatchGroup = DispatchGroup()
        var careRoutineId: Int?

        
        // Fetch data1
        dispatchGroup.enter()
        Network.fetchData(query: FetchPlantCareRoutineIdQuery(plantId: plantId)) { result in
            switch result {
            case .success(let data):
                careRoutineId = data.careRoutine.first?.id
            case .failure(let error):
                Logger.error("ERROR: \(error)")
            }
            dispatchGroup.leave()
        }
        
        // Run a block of code when all requests are completed
        dispatchGroup.notify(queue: .main) {
            guard let careRoutineId = careRoutineId else { return }
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
            let timestamp = dateFormatter.string(from: Date())
            
            Network.performMutation(mutation: AddRoutineStepMutation(input: RoutineStep_insert_input(
                careRoutineId: careRoutineId,
                completedAt: timestamp,
                description: stepDescription,
                stepFrequency: frequency,
                updatedAt: timestamp
            ))) { result in
                switch result {
                case .success(let success):
//                    careRoutineId = success.insertCareRoutineOne?.id
                    Logger.info("\(success.insertRoutineStepOne?.description)")
                    self.onRoutineAdded?()
                    UIAppDelegate?.hideLoadingIndicator()
                case .failure(let failure):
                    Logger.error("\(failure)")
                }
                
            }
        }

    }
    
    public func buildEmptySections() {
        sectionSequence = SectionSequence(
            sections: [
                SingleColumnSection(cellConfigurators: [frequencyPickerInputCellConfigurator]),
                makeStepInputSection()
            ])
    }
    
    //MARK: - Private methods
    
    private func makeAddButton() -> SingleColumnSection {
        let didPressButton: () -> Void = { [weak self] in
            guard let self = self else { return }
            Logger.info("TAP ADD")
            self.onAddPlantPressed?()
        }
        let configurator = AddButtonCellConfigurator(data: AddButtonCellData(SFSymbolName: "plus", buttonName: "Add plant", didPressButton: didPressButton))
        
        return SingleColumnSection(cellConfigurators: [configurator])
    }
    
    private func makeAddCareRoutineButton() -> SingleColumnSection {
        let didPressButton: () -> Void = { [weak self] in
            guard let self = self else { return }
            Logger.info("TAP ADD ROUTINE")
            self.onAddCareRoutinePressed?()
        }
        let configurator = AddButtonCellConfigurator(data: AddButtonCellData(SFSymbolName: "checkmark.seal", buttonName: "Add care routine", didPressButton: didPressButton))
        
        return SingleColumnSection(cellConfigurators: [configurator])
    }
    
    private func makeHelloHeaderSection() -> SingleColumnSection {
        let configurator = HelloHeaderCellConfigurator(data: TestViewCellData(title: "ADDRoutine"))

        return SingleColumnSection(cellConfigurators: [configurator])
    }
    
    // MARK: - Selectors
    
    @objc private func didTapDone(sender: UIBarButtonItem) {
        hideKeyboard?()
    }
    
}


