//
//  ListOfMoviePresenter.swift
//  Swift_Viper
//
//  Created by Rodo on 01/04/2023.
//

import Foundation

protocol ListOfMoviesUI: AnyObject {
    func update(movies: [PopularMovieEntity])
}

class ListOfMoviesPresenter {
    
    var ui: ListOfMoviesUI?
    
    private let listOfMoviesInteractor: ListOfMoviesInteractor
    var models: [PopularMovieEntity] = []
    
    init(listOfMoviesInteractor: ListOfMoviesInteractor) {
        self.listOfMoviesInteractor = listOfMoviesInteractor
    }
    
    func onViewAppear() {
        Task {
            // Llamo al Interactor para traer la info de la API
            models = await listOfMoviesInteractor.getListOfMovies().results
            
            // Devuelvo la info a la View
            ui?.update(movies: models)
        }
    }
    
}
