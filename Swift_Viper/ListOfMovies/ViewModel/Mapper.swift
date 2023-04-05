//
//  Mapper.swift
//  Swift_Viper
//
//  Created by Rodo on 05/04/2023.
//

import Foundation

struct Mapper {
    func map(entity: PopularMovieEntity) -> ViewModel {
        ViewModel(title: entity.title,
                overview: entity.overview,
                imageURL: URL(string: "https://image.tmdb.org/t/p/w200" + entity.imageURL))
    }
}
