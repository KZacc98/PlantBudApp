//
//  HomeMenuViewModel.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 27/11/2022.
//

import UIKit

final class HomeMenuViewModel {

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
        UIAppDelegate?.showLoadingIndicator()
    }

    public func buildSections() {
        sectionSequence = SectionSequence(
            sections: [
                makeHelloHeaderSection()
        ])
    }

    //MARK: - Private methods

    private func makeHelloHeaderSection() -> SingleColumnSection {

        let configurator = HelloHeaderCellConfigurator(data: TestViewCellData(title: "Hello there"))

        return SingleColumnSection(cellConfigurators: [configurator])
    }

    // MARK: - Selectors

}

