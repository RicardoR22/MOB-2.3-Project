//
//  ServiceLayer.swift
//  Mob2.3FinalProject
//
//  Created by Ricardo Rodriguez on 7/2/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import Foundation

// customized error messages
enum NetworkingError: Error {
    
    case badURL
    case requestFailed
    case jsonConversionFailure
    case invalidData
    case responseUnsuccessful
    case jsonParsingFailure
    
    var localizedDescription: String {
        switch self {
        case .badURL: return "bad URL"
        case .requestFailed: return "Request Failed"
        case .invalidData: return "Invalid Data"
        case .responseUnsuccessful: return "Response Unsuccessful"
        case .jsonParsingFailure: return "JSON Parsing Failure"
        case .jsonConversionFailure: return "JSON Conversion Failure"
            
        }
    }
}

// return type to determine whether api call succeeded or failed
enum Result<T>{
    case success(T)
    case failure(NetworkingError)
}

class ServiceLayer {
    
    //generic class function that is codable (need to pull data from api, convert to object)
    class func request<T: Codable>(router: Router, completion: @escaping (Result<T>) ->()) {
        
        //build url
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        components.queryItems = router.params
        
        guard let url = components.url else {
            completion(.failure(.badURL))
            return
        }
        
        print(url)
        
        //create request
        var urlRequest = URLRequest(url: url)
        //specify request method
        urlRequest.httpMethod = router.method
        
        //create session
        let session = URLSession(configuration: .default)
        
        //create data task
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            
            //checks to make sure process of making network call to data goes smoothly
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.requestFailed))
                return
            }
            
            if httpResponse.statusCode != 200 {
                print("status code: \(httpResponse.statusCode)")
                completion(.failure(.responseUnsuccessful))
            }
            
            if let responseData = data {
                do {
                    let responseObj = try JSONDecoder().decode(T.self, from: responseData)
                    completion(.success(responseObj))
                } catch {
                    completion(.failure(.jsonConversionFailure))
                }
            } else {
                completion(.failure(.invalidData))
            }
        }
        dataTask.priority = 1.0
        dataTask.resume()
    }
}
