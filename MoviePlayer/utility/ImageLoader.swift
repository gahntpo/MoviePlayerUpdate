//
//  ImageLoader.swift
//  MoviePlayer
//
//  Created by Karin Prater on 04.08.21.
//

import Foundation
import SwiftUI

class ImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    
    var url: String = ""
    
    func load(url: String) {
        self.url = url
        
        guard let imageURL = URL(string: url) else {
            fatalError("ImageURL is not correct!")
        }
        isLoading = true
        ImageCache.publicCache.load(url: imageURL as NSURL) { [weak self] url, image in
            self?.isLoading = true
            let url = url as URL
            if let  image = image, self?.url == url.absoluteString {
                self?.image = image
            }
        }
        
        
//        URLSession.shared.dataTask(with: imageURL) { data, response, error in
//
//            guard let data = data, error == nil else {
//                DispatchQueue.main.async { [weak self] in
//                    self?.errorMessage = error?.localizedDescription
//                }
//                return
//            }
//
//            let image = UIImage(data: data)
//            DispatchQueue.main.async { [weak self] in
//                self?.image = image
//            }
//
//        }.resume()
        
    }
    
    
    
}
