//
//  ResultsTableController.swift
//  MoviePlayer
//
//  Created by Karin Prater on 08.08.21.
//

import UIKit

class ResultsTableController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMovies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BaseTableViewController.tableViewCellIdentifier,
                                                       for: indexPath) as? MovieCell else {
            fatalError("Cannot create new cell")
        }
        
        
        
        let movie = filteredMovies[indexPath.row]
        configureCell(cell, forMovie: movie)
        
        return cell
                
    }

}
