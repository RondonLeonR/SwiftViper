//
//  DetailMovieEntity.swift
//  Swift_Viper
//
//  Created by Rodo on 06/04/2023.
//

import Foundation

struct DetailMovieEntity: Decodable {
    let title: String
    let overview: String
    let backdropPath: String
    let status: String
    let releaseDate: String
    let voteAverage: Double
    let voteCount: Int
}
