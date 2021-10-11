//
//  Constant.swift
//  MoviePlayer
//
//  Created by Karin Prater on 04.08.21.
//

import Foundation

struct Constants {
   
    
   // API key from Youtube v4 is stored in Youtube.plist under key APIKey
   static func key() -> String {
        
        let plistName = "Youtube"
        if  let path = Bundle.main.path(forResource: plistName, ofType: "plist"),
            let xml = FileManager.default.contents(atPath: path),
            let preferences = try? PropertyListDecoder().decode(Preferences.self, from: xml) {
            return preferences.APIKey
           
        }else {
            return ""
        }
            
    }
    
}

struct Preferences: Codable {
    var APIKey:String
}
