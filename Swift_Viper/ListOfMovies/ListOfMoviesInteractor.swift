//
//  ListOfMoviesInteractor.swift
//  Swift_Viper
//
//  Created by Rodo on 01/04/2023.
//

import Foundation

let kApiKey = "fd99cf9476458309b69800cbf7766f35"
let kUrlGeneral = "https://api.themoviedb.org/3/"

class ListOfMoviesInteractor {
    
    // Llamada a la API para obtener la info
    func getListOfMovies() async -> PopularMovieResponseEntity {
        let url = URL(string: "\(kUrlGeneral)movie/popular?api_key=\(kApiKey)")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(PopularMovieResponseEntity.self, from: data)
    }
    
}
