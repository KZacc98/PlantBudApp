//
//  AddRoutineStepCellConfigurator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 15/01/2023.
//

import UIKit

final class AddRoutineStepCellConfigurator: NSObject {

    //MARK: - Private properties

    private var data: AddRoutineStepCellData
    private var textFieldValue: String?
    let profilePicturePlaceholder: String = "https://res.cloudinary.com/dv1dmymg2/image/upload/v1674924697/PlantBuddy/Placeholders/UserImagePlaceholderLight_hthfkm.png"

    //MARK: - Initialization

    init(data: AddRoutineStepCellData) {
        self.data = data
    }
    
    @objc private func didPressAddStep(tapGestureRecognizer: UITapGestureRecognizer) {
        data.didPressAddStep?(textFieldValue)
    }
}

//MARK: - ReusableViewConfiguratorInterface

extension AddRoutineStepCellConfigurator: ReusableViewConfiguratorInterface {
    var type: AnyClass {
        return AddRoutineStepCell.self
    }

    func configure(view: UIView) {
        guard let view = view as? AddRoutineStepCell else { return }

        view.selectionStyle = .none
        view.descriptionTextView.text = data.text
        view.descriptionTextView.returnKeyType = data.returnTypeKey
        view.descriptionTextView.autocapitalizationType = data.autoCapitalizationType
        view.setTextViewHeight(height: data.textViewHeight)
        view.textViewDidEndEditing = data.textViewDidEndEditing
        view.textViewShouldChangeInRange = data.textViewShouldChangeInRange
        view.textViewDidChange = { [weak self] text in
            self?.data.text = text
            self?.textFieldValue = text
            self?.data.textViewDidChange?(text)
        }
        view.addAnotherStepButton.isUserInteractionEnabled = true
        view.addAnotherStepButton.gestureRecognizers?.forEach {
            view.addAnotherStepButton.removeGestureRecognizer($0)
        }
        
        view.addAnotherStepButton.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(didPressAddStep(tapGestureRecognizer:))))
    }

    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
        return UITableView.automaticDimension
    }
}
