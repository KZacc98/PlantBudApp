//
//  ProfileViewModel.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 13/01/2023.
//

import UIKit

final class ProfileViewModel {
    
    //MARK: - Binding closures
    
    public var onSectionSequenceChange: ((SectionSequence) -> Void)?
    public var onLogout: (() -> Void)?
    public var onError: ((Error) -> ())?
    
    //MARK: Private properties
    
    private var sectionSequence: SectionSequence = SectionSequence() {
        didSet {
            onSectionSequenceChange?(sectionSequence)
        }
    }
    
    private lazy var logoutButton: MainButtonCellConfigurator = {
        let didPressButton: () -> () = { [weak self] in
            DialogManager.showConfirmationDialog(
                title: "Logout",
                message: "U really wanna logout",
                cancelButtonTitle: "nah",
                acceptBlock: {
                    UIAppDelegate?.applicationCoordinator?.logout()
                },
                rejectBlock: {
                    Logger.info("stay logged in")
                }
            )
            
        }
        let buttonInsets = UIEdgeInsets(top: 24.deviceSizeAware,
                                        left: 12,
                                        bottom: -24.deviceSizeAware,
                                        right: -12)
        let data = MainButtonCellData(title: "Logout".uppercased(),
                                      buttonInsets: buttonInsets,
                                      didPressButton: didPressButton)
        
        return MainButtonCellConfigurator(data: data)
    }()
    
    //MARK: - Initialization
    
//    init(plant: Plant) {
//        self.plant = plant
//    }
    
    //MARK: - Access methods
    
    public func loadData(refresh: Bool = false) {
//        UIAppDelegate?.showLoadingIndicator()
        buildSections()
    }
    
    public func buildSections() {
        sectionSequence = SectionSequence(
            sections: [
                makeProfilePictureSection(),
                SingleColumnSection(cellConfigurators: [logoutButton])
            ]
        )
    }

    
    //MARK: - Private methods
    
    private func makeProfilePictureSection() -> SingleColumnSection {
        let configurator = ProfilePictureCellConfigurator(imageUrl: UserContext.shared.userProfile?.profilePicture)
        
        return SingleColumnSection(cellConfigurators: [configurator])
        
    }
    // MARK: - Selectors
    
}



