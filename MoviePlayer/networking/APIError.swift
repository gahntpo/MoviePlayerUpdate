//
//  APIError.swift
//  CollaborationUIKitProject



import Foundation

enum APIError: Swift.Error, CustomStringConvertible {
    
    case badURL
    case url(URLError?)   
    case badResponse(statusCode: Int)
    case parsing(DecodingError?)
    case unknown(Error)
    
    var localizedDescription: String {
        // user feedback
        switch self {
        case .url(let error):
            return error?.localizedDescription ?? "Something went wrong with the internet connection"
        case .badResponse( _):
            return "Sorry, the communication to our server failed."
        case .parsing:
            return "Sorry, we are unable to handle the response from our server."
        case .unknown:
            return "Sorry, something went wrong."
        case .badURL:
            return "Sorry, something went wrong."
        }
    }
    
    var description: String {
        // info for debugging
        switch self {
        case .url(let error):
            return error?.localizedDescription ?? "unown error"
        case .badResponse(let status):
           return "error bad response with status code: \(status)"
        case .parsing(let error):
            return "parsing error \(error?.localizedDescription ?? "parsing error"))"
        case .badURL:
            return "could not create url from string"
        default:
            return "unknown error"
        }
    }

    
}
