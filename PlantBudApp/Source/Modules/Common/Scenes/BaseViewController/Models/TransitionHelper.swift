//
//  TransitionHelper.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 20/11/2022.
//

import Foundation

class TransitionHelper {
    var viewWillAppear: ((_ animated: Bool) -> Void)?
    var viewDidAppear: ((_ animated: Bool) -> Void)?
    var viewWillDisappear: ((_ animated: Bool) -> Void)?
    var viewDidDisappear: ((_ animated: Bool) -> Void)?
}
