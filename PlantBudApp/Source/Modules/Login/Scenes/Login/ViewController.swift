//
//  LoginViewController.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 19/11/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    lazy var test: UILabel = {
        let test = UILabel()
        test.text = "login".localized
        test.translatesAutoresizingMaskIntoConstraints = false
        test.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        test.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        test.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        test.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
        view.addSubview(test)
        
        return test
    }()

    override func viewDidLoad() {
        
        let test = UILabel()
        test.text = "login".localized
        view.addSubview(test)
        test.translatesAutoresizingMaskIntoConstraints = false
        test.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        test.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }


}

