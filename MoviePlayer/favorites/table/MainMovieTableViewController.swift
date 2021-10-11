//
//  MainMovieTableViewController.swift
//  MoviePlayer
//
//  Created by Karin Prater on 08.08.21.
//

import UIKit
import SwiftUI
import Combine

class MainMovieTableViewController: BaseTableViewController {
    
    var favorites: FavoritesManager!
    
    var movies: [Movie] = [Movie]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var subscriptions = Set<AnyCancellable>()
    
    init(favorites: FavoritesManager) {
        self.favorites = favorites
//        filteredMovies = favorites.movies
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var searchController: UISearchController!
    private var resultsTableController: ResultsTableController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
    }
    
    
    func configureTable() {
        resultsTableController = ResultsTableController()

        resultsTableController.tableView.delegate = self
        
        searchController = UISearchController(searchResultsController: resultsTableController)
        searchController.searchResultsUpdater = self
        searchController.searchBar.autocapitalizationType = .none
        
        navigationItem.searchController = searchController
        // Make the search bar always visible.
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self // Monitor when the search button is tapped
        
        searchController.delegate = self
        self.movies = favorites.movies
        
        favorites.$movies.sink { [weak self] movies in
//            self?.updateMovies(for: self?.searchBar.text ?? "", allMovies: movies)
            self?.movies = movies
           
        }.store(in: &subscriptions)
    }



}

//MARK: - UITableViewDataSource
extension MainMovieTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BaseTableViewController.tableViewCellIdentifier,
                                                       for: indexPath) as? MovieCell else {
            fatalError("Cannot create new cell")
        }
        
        
        
        let movie = movies[indexPath.row]
        configureCell(cell, forMovie: movie)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMovie = favorites.movies[indexPath.row]
        
        // todo - make star rating editable
        let detail = MovieDetailView(movie: selectedMovie)
        let controller = UIHostingController(rootView: detail)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    

}


extension MainMovieTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
        let searchText = searchController.searchBar.text ?? ""
        
     
        if let resultsController = searchController.searchResultsController as? ResultsTableController {
            
            if searchText.count == 0 {
                resultsController.filteredMovies = favorites.movies
            }else {
                resultsController.filteredMovies = favorites.movies.filter({ $0.title.contains(searchText) })
            }
            resultsController.tableView.reloadData()
        }
          
        
        
        
    }
}

extension MainMovieTableViewController: UISearchControllerDelegate {
    
}

extension MainMovieTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
