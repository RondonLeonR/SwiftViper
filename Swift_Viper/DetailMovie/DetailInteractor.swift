//
//  DetailInteractor.swift
//  Swift_Viper
//
//  Created by Rodo on 06/04/2023.
//

import Foundation

// Usando protocolos

protocol DetailInteractable: AnyObject {
    func getDetailMovie(withId id: String) async -> DetailMovieEntity
}

class DetailInteractor: DetailInteractable {
    
    func getDetailMovie(withId id: String) async -> DetailMovieEntity {
        let url = URL(string: "\(kUrlGeneral)movie/\(id)?api_key=\(kApiKey)")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return try! jsonDecoder.decode(DetailMovieEntity.self, from: data)
    }
}
