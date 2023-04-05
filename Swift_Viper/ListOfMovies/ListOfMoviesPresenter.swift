//
//  ListOfMoviePresenter.swift
//  Swift_Viper
//
//  Created by Rodo on 01/04/2023.
//

import Foundation

// Creando protocolo para testear modulos
protocol ListOfMoviesPresentable: AnyObject {
    var ui: ListOfMoviesUI? { get }
    var viewModels: [ViewModel] { get }
    func onViewAppear()
}

protocol ListOfMoviesUI: AnyObject {
    func update(movies: [ViewModel])
}

class ListOfMoviesPresenter: ListOfMoviesPresentable {
    
    weak var ui: ListOfMoviesUI?
    
    private let listOfMoviesInteractor: ListOfMoviesInteractable
    var viewModels: [ViewModel] = []
    private let mapper: Mapper
    
    init(listOfMoviesInteractor: ListOfMoviesInteractable, mapper: Mapper = Mapper()) {
        self.listOfMoviesInteractor = listOfMoviesInteractor
        self.mapper = mapper
    }
    
    func onViewAppear() {
        Task {
            // Llamo al Interactor para traer la info de la API
            let models = await listOfMoviesInteractor.getListOfMovies().results
            
            // Mapeo de Model para descartar info innecesaria
            viewModels = models.map(mapper.map(entity:))
            
            // Devuelvo la info a la View
            ui?.update(movies: viewModels)
        }
    }
    
}
