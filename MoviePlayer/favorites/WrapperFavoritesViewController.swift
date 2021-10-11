//
//  WrapperFavoritesViewController.swift
//  MoviePlayer
//
//  Created by Karin Prater on 06.08.21.
//

import SwiftUI

struct WrapperFavoritesViewController: UIViewControllerRepresentable {
    
    let favorites: FavoritesManager
    
    @Binding var selectedMovie: Movie?
    
    
    func makeUIViewController(context: Context) -> UINavigationController {

        let main = MainMovieTableViewController(favorites: favorites)
        main.title = "Favorites"
       
        //NEED to use UINavigationController instead of SwiftUI NavigationView
        // otherwise searchbar is not visible
       let controller = UINavigationController(rootViewController: main)
        controller.navigationBar.prefersLargeTitles = false
     
        return controller
    }

    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        if selectedMovie == nil,
           let main = uiViewController.viewControllers.last as? MainMovieTableViewController {
    
            main.tableView.deselectSelectedRow(animated: true)
        }
    }

}

struct WrapperFavoritesViewController_Previews: PreviewProvider {
    static var previews: some View {
        WrapperFavoritesViewController(favorites: FavoritesManager.example(), selectedMovie: .constant(nil))
    }
}
