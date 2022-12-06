//
//  LoadingButton.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 26/11/2022.
//

import UIKit

class LoadingButton: UIButton {
    
    // MARK: - Private properties
    
    private var activityIndicator: UIActivityIndicatorView!
    private var feedbackGenerator: UIImpactFeedbackGenerator?
    
    private var isLoading: Bool = false {
        didSet {
            self.isUserInteractionEnabled = !isLoading
        }
    }
    
    // MARK: - Internal properties
    
    func showLoading() {
        if (activityIndicator == nil) {
            activityIndicator = createActivityIndicator()
        }
        
        isLoading = true
        showSpinning()
    }
    
    func hideLoading() {
        isLoading = false
        activityIndicator.stopAnimating()
    }
    
    // MARK: - Override methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        feedbackGenerator = UIImpactFeedbackGenerator.init(style: .light)
        feedbackGenerator?.prepare()
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        feedbackGenerator?.impactOccurred()
        feedbackGenerator = nil
    }
    
    // MARK - Private methods
    
    private func createActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = Color.brandWhite
        
        return activityIndicator
    }
    
    private func showSpinning() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(activityIndicator)
        setLayoutForIndicator()
        activityIndicator.startAnimating()
    }
    
    private func setLayoutForIndicator() {
        activityIndicator.centerYAnchor.constrain(anchor: self.centerYAnchor)
        activityIndicator.trailingAnchor.constrain(anchor: self.trailingAnchor, constant: -12)
    }
}

