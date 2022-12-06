//
//  BadgesViewModel.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 05/12/2022.
//

import UIKit

final class BadgesViewModel {

    //MARK: - Binding closures

    public var onSectionSequenceChange: ((SectionSequence) -> Void)?
    public var onError: ((Error) -> ())?

    //MARK: Private properties
    
    private var sectionSequence: SectionSequence = SectionSequence() {
        didSet {
            onSectionSequenceChange?(sectionSequence)
        }
    }
    
    //MARK: - Initialization
    
    //MARK: - Access methods
    
    public func loadData(refresh: Bool = false) {

    }

    public func buildSections() {
        sectionSequence = SectionSequence(
            sections: [
                makeHelloHeaderSection()
        ])
    }
    
    //MARK: - Private methods

    private func makeHelloHeaderSection() -> SingleColumnSection {
        let configurator = HelloHeaderCellConfigurator(data: TestViewCellData(title: "Badges"))

        return SingleColumnSection(cellConfigurators: [configurator])
    }

    // MARK: - Selectors

}

