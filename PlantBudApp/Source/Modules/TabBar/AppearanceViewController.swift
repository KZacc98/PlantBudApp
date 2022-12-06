//
//  AppearanceViewController.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 27/11/2022.
//

import UIKit

final class AppearanceViewController: UIViewController {
    
    //MARK: - Private properties
    
    public let viewModel: AppearanceViewModel = AppearanceViewModel()
    
    //MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        
        setupView()
        viewModel.loadData()
    }
    
    //MARK: - Setup
    
    private func setupView() {
        view.backgroundColor = Color.red
    }
}

