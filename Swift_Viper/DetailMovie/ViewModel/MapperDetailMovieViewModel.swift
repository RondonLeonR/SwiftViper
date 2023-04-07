//
//  MapperDetailMovieViewModel.swift
//  Swift_Viper
//
//  Created by Rodo on 06/04/2023.
//

import Foundation

struct MapperDetailMovieViewModel {
    func map(entity: DetailMovieEntity) -> DetailMovieViewModel {
        DetailMovieViewModel(title: entity.title,
                         overview: entity.overview,
                         backdropPath: URL(string: "https://image.tmdb.org/t/p/w200" + entity.backdropPath))
    }
}
