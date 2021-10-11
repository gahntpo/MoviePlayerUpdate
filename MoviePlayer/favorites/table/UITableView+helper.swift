//
//  UITableView+helper.swift
//  MoviePlayer
//
//  Created by Karin Prater on 07.08.21.
//

import Foundation
import UIKit



//MARK: - tableview helper
extension UITableView {

    func deselectSelectedRow(animated: Bool) {
        if let indexPathForSelectedRow = self.indexPathForSelectedRow {
            self.deselectRow(at: indexPathForSelectedRow, animated: animated)
        }
    }

}
