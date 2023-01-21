//
//  StepFrequencyPickerCell.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 15/01/2023.
//

import UIKit

final class StepFrequencyPickerCell: UITableViewCell {

    //MARK: - Public properties
    
    public var textViewDidEndEditing: ((String?) -> ())?
    public var textViewDidChange: ((String?) -> ())?
    public var textViewShouldChangeInRange: ((UITextView, NSRange, String) -> (Bool))?
    
    public lazy var mainBackgroundView: UIView = {
        let view = UIView()
        view.setShadow(cornerRadius: 8,
                       shadowOpacity: 0.1,
                       shadowRadius: 4,
                       shadowOffset: .zero,
                       shadowColor: Color.brandBlack)
        view.backgroundColor = Color.brandWhite
        contentView.addSubviewsUsingAutoLayout(view)

        return view
    }()
        //daily
    
    lazy var dailyButtonContainer: SquareButton = {
        let view = SquareButton()
        mainBackgroundView.addSubviewsUsingAutoLayout(view)

        return view
    }()
    
    //weekly
    lazy var weeklyButtonContainer: SquareButton = {
        let view = SquareButton()
        mainBackgroundView.addSubviewsUsingAutoLayout(view)

        return view
    }()
    //monthly
    lazy var monthlyButtonContainer: SquareButton = {
        let view = SquareButton()
        mainBackgroundView.addSubviewsUsingAutoLayout(view)

        return view
    }()
    
    //MARK: - Initialization

    override init(style: CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupAutoLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setupAutoLayout()
    }
    
    //MARK: - Setup

    private func setupAutoLayout() {
        contentView.fill(with: mainBackgroundView,
                         to: contentView.safeAreaLayoutGuide,
                         insets: UIEdgeInsets(top: 12, left: 12, bottom: -12, right: -12))
    
        dailyButtonContainer.topAnchor.constrain(anchor: mainBackgroundView.topAnchor, constant: 12)
        dailyButtonContainer.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor, constant: -12)
        dailyButtonContainer.widthAnchor.constrain(constant: 100)
        dailyButtonContainer.heightAnchor.constrain(anchor: dailyButtonContainer.widthAnchor)
        dailyButtonContainer.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor, constant: 12)
        
        weeklyButtonContainer.topAnchor.constrain(anchor: mainBackgroundView.topAnchor, constant: 12)
        weeklyButtonContainer.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor, constant: -12)
        weeklyButtonContainer.widthAnchor.constrain(constant: 100)
        weeklyButtonContainer.heightAnchor.constrain(anchor: weeklyButtonContainer.widthAnchor)
        weeklyButtonContainer.centerXAnchor.constrain(anchor: mainBackgroundView.centerXAnchor)
        
        monthlyButtonContainer.topAnchor.constrain(anchor: mainBackgroundView.topAnchor, constant: 12)
        monthlyButtonContainer.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor, constant: -12)
        monthlyButtonContainer.widthAnchor.constrain(constant: 100)
        monthlyButtonContainer.heightAnchor.constrain(anchor: monthlyButtonContainer.widthAnchor)
        monthlyButtonContainer.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor, constant: -12)

    }
}

////MARK: - UITextViewDelegate
//
//extension StepFrequencyPickerCell: UITextViewDelegate {
//    public func textViewDidChange(_ textView: UITextView) {
//        textViewDidChange?(textView.text)
//    }
//
//    public func textViewDidEndEditing(_ textView: UITextView) {
//        textViewDidEndEditing?(textView.text)
//    }
//
//    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        if let shouldChange = textViewShouldChangeInRange?(textView, range, text) {
//            return shouldChange
//        } else {
//            return true
//        }
//    }
//}


