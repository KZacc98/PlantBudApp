//
//  AddRoutineStepCell.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 15/01/2023.
//

import UIKit

final class AddRoutineStepCell: UITableViewCell {

    //MARK: - Public properties
    
    public var textViewDidEndEditing: ((String?) -> ())?
    public var textViewDidChange: ((String?) -> ())?
    public var textViewShouldChangeInRange: ((UITextView, NSRange, String) -> (Bool))?

    public lazy var shadowBackdropView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.brandWhite
        contentView.addSubviewsUsingAutoLayout(view)

        return view
    }()
    
    public lazy var mainBackgroundView: UIView = {
        let view = UIView()
        view.setShadow(cornerRadius: 8,
                       shadowOpacity: 0.1,
                       shadowRadius: 4,
                       shadowOffset: .zero,
                       shadowColor: Color.brandBlack)
        view.backgroundColor = Color.brandWhite
        shadowBackdropView.addSubviewsUsingAutoLayout(view)

        return view
    }()
    
    public lazy var cornerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        mainBackgroundView.addSubviewsUsingAutoLayout(view)

        return view
    }()
    
    lazy var addAnotherStepButtonContainer: UIView = {
        let view = UIView()
        view.setShadow(cornerRadius: 25,
                       shadowOpacity: 0.9,
                       shadowRadius: 4,
                       shadowOffset: .zero,
                       shadowColor: Color.brandGreen)
        view.backgroundColor = Color.brandGreen
        mainBackgroundView.addSubviewsUsingAutoLayout(view)

        return view
    }()
    
    lazy var addAnotherStepButton: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.tintColor = Color.brandWhite
        view.image = UIImage(systemName: "plus")
        view.sizeToFit()
        addAnotherStepButtonContainer.addSubviewsUsingAutoLayout(view)
        
        return view
    }()

    public lazy var descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.tintColor = Color.brandBlack
        textView.textColor = Color.brandBlack
        textView.isScrollEnabled = false
        textView.font = Font.noticiaRegular(size: 14)
        textView.textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        textView.delegate = self
        cornerView.addSubviewsUsingAutoLayout(textView)

        return textView
    }()
    
    //MARK: - Private properties
    
    private lazy var textViewHeightConstrain: NSLayoutConstraint = {
        return descriptionTextView.heightAnchor.constrain(.greaterThanOrEqual, constant: 100.deviceSizeAware)
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
    
    //MARK: - Access methods
    
    public func setTextViewHeight(height: CGFloat) {
        textViewHeightConstrain.constant = height
    }

    //MARK: - Setup

    private func setupAutoLayout() {
        contentView.fill(with: shadowBackdropView,
                         to: contentView.safeAreaLayoutGuide)
        
        mainBackgroundView.topAnchor.constrain(anchor: shadowBackdropView.topAnchor, constant: 12)
        mainBackgroundView.bottomAnchor.constrain(anchor: shadowBackdropView.bottomAnchor, constant: -12)
        mainBackgroundView.leadingAnchor.constrain(anchor: shadowBackdropView.leadingAnchor, constant: 12)
        mainBackgroundView.trailingAnchor.constrain(anchor: shadowBackdropView.trailingAnchor, constant: -12)
        
        cornerView.topAnchor.constrain(anchor: mainBackgroundView.topAnchor, constant: 12)
        cornerView.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor, constant: -12)
        cornerView.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor, constant: -12)
        cornerView.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor, constant: 12)
        
        addAnotherStepButtonContainer.heightAnchor.constrain(constant: 50)
        addAnotherStepButtonContainer.widthAnchor.constrain(anchor: addAnotherStepButtonContainer.heightAnchor)
        addAnotherStepButtonContainer.centerXAnchor.constrain(anchor: mainBackgroundView.centerXAnchor)
        addAnotherStepButtonContainer.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor, constant: 25)
        
        addAnotherStepButtonContainer.fill(with: addAnotherStepButton, to: addAnotherStepButtonContainer.safeAreaLayoutGuide, insets: UIEdgeInsets(top: 5, left: 5, bottom: -5, right: -5))
        
        cornerView.fill(with: descriptionTextView, to: cornerView.safeAreaLayoutGuide)

    }
}

//MARK: - UITextViewDelegate

extension AddRoutineStepCell: UITextViewDelegate {
    public func textViewDidChange(_ textView: UITextView) {
        textViewDidChange?(textView.text)
    }

    public func textViewDidEndEditing(_ textView: UITextView) {
        textViewDidEndEditing?(textView.text)
    }

    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if let shouldChange = textViewShouldChangeInRange?(textView, range, text) {
            return shouldChange
        } else {
            return true
        }
    }
}

