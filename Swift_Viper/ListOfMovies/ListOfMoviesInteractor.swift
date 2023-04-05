//
//  ListOfMoviesInteractor.swift
//  Swift_Viper
//
//  Created by Rodo on 01/04/2023.
//

import Foundation

// Creando protocolo para testear modulos
protocol ListOfMoviesInteractable: AnyObject {
    func getListOfMovies() async -> PopularMovieResponseEntity
}

let kApiKey = "fd99cf9476458309b69800cbf7766f35"
let kUrlGeneral = "https://api.themoviedb.org/3/"

class ListOfMoviesInteractor: ListOfMoviesInteractable {
    
    // Llamada a la API para obtener la info
    func getListOfMovies() async -> PopularMovieResponseEntity {
        let url = URL(string: "\(kUrlGeneral)movie/popular?api_key=\(kApiKey)")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(PopularMovieResponseEntity.self, from: data)
    }
    
}

class ListOfMoviesInteractorMock: ListOfMoviesInteractable {
    func getListOfMovies() async -> PopularMovieResponseEntity {
        return PopularMovieResponseEntity(results: [
            .init(id: 0, title: "Rodo Rondon", overview: "Hola", imageURL: "", votes: 10),
            .init(id: 1, title: "Rodo Rondon", overview: "Adios", imageURL: "", votes: 10),
            .init(id: 2, title: "Rodo Rondon", overview: "Hola!", imageURL: "", votes: 10),
            .init(id: 3, title: "Rodo Rondon", overview: "Chau", imageURL: "", votes: 10),
            .init(id: 4, title: "Rodo Rondon", overview: "Buenas!", imageURL: "", votes: 10)])
    }
}
