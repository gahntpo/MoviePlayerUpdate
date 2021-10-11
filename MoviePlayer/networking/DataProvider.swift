//
//  DataProvider.swift
//  FindMyDog
//
//  Created by Karin Prater on 07.08.21.
//

import Foundation

struct DataProvider {
    
    func fetch<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping(Result<T,APIError>) -> Void) {
        
        guard  let url = url else {
            completion(Result.failure(APIError.badURL))
            return
        }
        
        let task =  URLSession.shared.dataTask(with: url) {  data, response, error in
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                
                if let data = data,
                   let result = try? JSONSerialization.jsonObject(with: data, options: []){
                    print("--- bad server request with return json:")
                    print(result)
                    //TODO: - pass down json response in error
                }
        
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
                
            } else if let data = data {
                
                do {
                    let decodedResult = try JSONDecoder().decode(type, from: data)
                    completion(Result.success(decodedResult))
                    
                }catch {
                    let decodingError = error as? DecodingError
                    completion(Result.failure(APIError.parsing(decodingError)))
                }
            }
            
        }
        
        task.resume()
      
    }
    
}
