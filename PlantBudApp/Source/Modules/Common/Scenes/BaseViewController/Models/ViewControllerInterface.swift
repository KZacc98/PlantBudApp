//
//  ViewControllerInterface.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 20/11/2022.
//

import UIKit

typealias ViewControllerInterface = UIViewController & TransitionHelperInterface

protocol TransitionHelperInterface where Self: UIViewController {
    var transitionHelper: TransitionHelper { get }
}
