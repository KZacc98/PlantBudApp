//
//  InputInterface.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 26/11/2022.
//

protocol InputInterface: ReusableViewConfiguratorInterface {
    var isFirstResponder: Bool { get }
    var didBecomeFirstResponder: ((InputInterface) -> Void)? { get }
    func resignFirstResponder()
    func becomeFirstResponder()
}

private enum InputType: Int {
    case next = 1, previous = -1
}

extension Array where Element == InputInterface {
    func nextInputBecomeFirstResponder(
        sectionSequence: SectionSequence,
        tableViewInterface: TableViewControllerInterface) {
        inputBecomeFirstResponder(
            inputType: .next, sectionSequence: sectionSequence,
            tableViewInterface: tableViewInterface)
    }
    
    func previousInputBecomeFirstResponder(
        sectionSequence: SectionSequence,
        tableViewInterface: TableViewControllerInterface) {
        inputBecomeFirstResponder(
            inputType: .previous, sectionSequence: sectionSequence,
            tableViewInterface: tableViewInterface)
    }
    
    fileprivate func inputBecomeFirstResponder(
        inputType: InputType,
        sectionSequence: SectionSequence,
        tableViewInterface: TableViewControllerInterface) {
        
        guard let currentResponderIndex = firstIndex(where: { $0.isFirstResponder }) else {
            Logger.debug("There is no first responder to resign")
            return
        }
        self[currentResponderIndex].resignFirstResponder()
        
        let nextResponderIndex = currentResponderIndex + inputType.rawValue
        
        guard self.indices.contains(nextResponderIndex) else {
            Logger.debug("Input array has no \(inputType == .next ? "next" : "previous") input")
            return
        }
        
        let nextInput = self[nextResponderIndex]
        
        guard let indexPath = sectionSequence.indexPath(for: nextInput) else {
            Logger.debug("Not found index path for: \(nextInput)")
            return
        }
        
        tableViewInterface.scrollToRow(at: indexPath, at: .none, animated: false)
        nextInput.becomeFirstResponder()
    }
}
