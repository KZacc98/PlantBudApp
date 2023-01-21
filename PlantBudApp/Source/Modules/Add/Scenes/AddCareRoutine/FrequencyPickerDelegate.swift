//
//  FrequencyPickerDelegate.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 20/01/2023.
//

import UIKit

final class FrequencyPickerDelegate: NSObject {
    
    //MARK: - Binding closures
    
    public var didSelectFrequency: ((StepFrequency) -> ())?
    
    //MARK: - Private properties
    
    private var frequencyList: [StepFrequency]
    
    //MARK: - Initialization
    
    init(frequencyList: [StepFrequency]) {
        self.frequencyList = frequencyList
    }
    
    //MARK: - Access methods
    
    public func setfrequencyList(_ frequencyList: [StepFrequency]) {
        self.frequencyList = frequencyList
    }
}

extension FrequencyPickerDelegate: UIPickerViewDelegate {
    public func pickerView(_ pickerView: UIPickerView,
                           titleForRow row: Int,
                           forComponent component: Int) -> String? {
        
        return frequencyList[row].displayName
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard !frequencyList.isEmpty else { return }
        didSelectFrequency?(frequencyList[row])
    }
}


extension FrequencyPickerDelegate: UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return frequencyList.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}
