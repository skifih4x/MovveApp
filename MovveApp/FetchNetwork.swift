//
//  NetworkManager.swift
//  MovveApp
//
//  Created by Артем Орлов on 29.08.2022.
//

import Foundation

struct NetworkManager {
    
    enum NetworkError: Error {
        case invalidURL
        case noData
        case decodingError
    }
    
    static let shared = NetworkManager()
    
    struct NetworkManager {
        
        static var shared = NetworkManager()
        
        func fetchMovie(urlString: String, completion: @escaping( Result<[Results], NetworkError> ) -> Void )  {

            guard let url = URL(string: urlString) else { return }
            
            URLSession.shared.dataTask(with: url) { data, _, error in
                
                guard let data = data else {
                    completion(.failure(.invalidURL))
                    print(error?.localizedDescription ?? "no movie")
                    return
                }
                
                do {
                    let movie = try JSONDecoder().decode(ContentTask.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(movie.results))
                    }
                } catch {
                    completion(.failure(.decodingError))
                }
            }.resume()
        }

    }

}
