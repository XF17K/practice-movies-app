//
//  NetworkManager.swift
//  practice-movies
//
//  Created by Burhan AFŞAR on 4.10.2023.
//

import Foundation

struct NetworkManager{
    static let shared = NetworkManager()
    
    private init(){}
    
    func request<T: Decodable>(
        url: URL,
        method: HTTPMethod = .get,
        parameters: [String: String]? = nil,
        headers: [String: String]? = nil,
        completion: @escaping (Result<T, Error>) -> Void
    ){
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        if let headers = headers{
            for(key, value) in headers{
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        if let parameters = parameters{
            var components = URLComponents(string: url.absoluteString)
            components?.queryItems = [
                URLQueryItem(name: parameters.first?.key ?? "", value: parameters.first?.value ?? "")
            ]
            
            if let url = components?.url{
                var request = URLRequest(url: url)
                print(url)
            }
        }
        
        
     
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error{
                completion(.failure(error))
                return
            }
            
            guard let data = data else{
                let error = NSError(domain: "InvalidData", code: 0, userInfo: nil)
                completion(.failure(error))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let responseObject = try decoder.decode(T.self, from: data)
                completion(.success(responseObject))
            }catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
