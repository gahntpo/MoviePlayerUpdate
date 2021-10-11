//
//  FavoritesManager.swift
//  MoviePlayer
//
//  Created by Karin Prater on 05.08.21.
//

import Foundation
import Combine


class FavoritesManager: ObservableObject {
    
    @Published var movies = [Movie]()
    
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
      
        //load favorites from disk
        loadFavorites()
       
        //save changes to favorites
        setupSaveData()
        
    }
    
    // used to know if movie is a favorite
    func favoritesContain(movie: Movie) -> Bool {
        if  movies.contains(movie) {
            return true
        } else {
            return false
        }
    }
    
    // called when user tabs on faviorite button in detail view
    func toggle(movie: Movie) {
        if let index = movies.firstIndex(of: movie) {
            movies.remove(at: index)
        } else {
            movies.append(movie)
        }
        
    }
    
    //MARK: - save and load
    
   private func loadFavorites() {
        let url = getDocumentURL()
       
        DispatchQueue.global(qos: .background).async {
            if let data = try? Data(contentsOf: url), let movies = try? JSONDecoder().decode([Movie].self, from: data) {
                DispatchQueue.main.async { [unowned self] in
//                    print("load finished")
                    self.movies = movies
                }
            }
        }
    }
    
    private func setupSaveData() {
        $movies
            .dropFirst()
            //.print("++ save data stream")
            .subscribe(on: DispatchQueue(label: "background queue"))
            .encode(encoder: JSONEncoder())
            .tryMap({ [unowned self] data in
                try data.write(to: self.getDocumentURL())
            })
            .receive(on: DispatchQueue.main)
            .sink { completion in
//                print("save action completed \(completion)")
            } receiveValue: { _ in
//                print("save was success")
            }.store(in: &subscriptions)
    }
    
    private func getDocumentURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0].appendingPathComponent("favorites")
    }
    
    
    static func example() -> FavoritesManager {
        let fav = FavoritesManager()
        fav.movies = [Movie.example1(), Movie.example3(), Movie.example2()]
        return fav
    }
}
