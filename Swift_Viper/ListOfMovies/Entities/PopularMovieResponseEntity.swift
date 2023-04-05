//
//  PopularMovieResponseEntity.swift
//  Swift_Viper
//
//  Created by Rodo on 01/04/2023.
//

import Foundation

struct PopularMovieResponseEntity: Decodable {
    let results: [PopularMovieEntity]
}
