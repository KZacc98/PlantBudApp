//
//  TableViewControllerInterface.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 26/11/2022.
//

import UIKit

protocol TableViewControllerInterface: AnyObject {
    func scrollToRow(at indexPath: IndexPath, completion: ((Bool) -> Void)?)
    func scrollToRow(at indexPath: IndexPath,
                     at scrollPosition: UITableView.ScrollPosition,
                     animated: Bool)
    func reloadRows(at indexPaths: [IndexPath])
    func reloadRows(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation)
    func reloadSections(at indexSet: IndexSet)
    func update()
}

extension TableViewControllerInterface where Self: SingleColumnViewControlerInterface {
    func scrollToRow(at indexPath: IndexPath, completion: ((Bool) -> Void)?) {
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            self?.tableView.scrollToRow(at: indexPath, at: .middle, animated: false)
        }, completion: completion)
    }
    
    func scrollToRow(at indexPath: IndexPath,
                     at scrollPosition: UITableView.ScrollPosition,
                     animated: Bool) {
        self.tableView.scrollToRow(at: indexPath, at: scrollPosition, animated: animated)
    }
    
    func reloadRows(at indexPaths: [IndexPath]) {
        self.tableView.reloadRows(at: indexPaths, with: .automatic)
    }
    
    func reloadRows(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation) {
        self.tableView.reloadRows(at: indexPaths, with: animation)
    }
    
    func reloadSections(at indexSet: IndexSet) {
        self.tableView.reloadSections(indexSet, with: .automatic)
    }
    
    func update() {
        UIView.performWithoutAnimation { [weak self] in
            self?.tableView.beginUpdates()
            self?.tableView.endUpdates()
        }
    }
}

