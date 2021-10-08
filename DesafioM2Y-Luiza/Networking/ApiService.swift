//
//  ApiService.swift
//  DesafioM2Y-Luiza
//
//  Created by Felipe SP on 07/10/21.
//guard let é tipo if-else mas testa se a optinal vem nil ou nao

import Foundation

class ApiService {
    
    private var dataTask: URLSessionDataTask?
    //duas funcoes
    func getMovieDetail(completion:@escaping (Result<MovieData, Error>) -> Void) {
    //mudar nome da funcao
        let MovieDataURL = "https://api.themoviedb.org/3/movie/1904?api_key=0d12134c7021069cdad317dca3601be9"
        
        guard let url = URL(string: MovieDataURL) else {return}
        
        dataTask = URLSession.shared.dataTask(with: url){
            data, response, error in
         
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...209).contains(response.statusCode) else {
                print("API Error")
                return //return(para) para sair desse bloco guard let
            }
            
            guard let data = data else {
                print("Empty Data")
                return
            }
            
            do {
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                //converte snakecase para camelcase-swift
                let jsonData = try decoder.decode(MovieData.self, from: data)
                completion(.success(jsonData))
                
                    
                
            } catch let error {
                print("deu erro aqui")
                completion(.failure(error))
            }
        }
        dataTask?.resume()
    }
    
}
