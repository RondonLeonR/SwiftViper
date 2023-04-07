//
//  DetailPresenter.swift
//  Swift_Viper
//
//  Created by Rodo on 06/04/2023.
//

import Foundation

protocol DetailPresenterUI: AnyObject {
    func updateUI(viewModel: DetailMovieViewModel)
}

protocol DetailPresentable: AnyObject {
    var ui: DetailPresenterUI? { get }
    var movieId: String { get }
    func onViewAppear()
}

class DetailPresenter: DetailPresentable {
    
    weak var ui: DetailPresenterUI?
    
    let movieId: String
    private let interactor: DetailInteractable
    private let mapper: MapperDetailMovieViewModel
    
    init(movieId: String,
        interactor: DetailInteractable,
         mapper: MapperDetailMovieViewModel) {
        self.movieId = movieId
        self.interactor = interactor
        self.mapper = mapper
    }
    
    func onViewAppear() {
        Task {
            let model = await interactor.getDetailMovie(withId: movieId)
            let viewModel = mapper.map(entity: model)
            
            // Le paso la viewModel a la UI
            await MainActor.run {
                self.ui?.updateUI(viewModel: viewModel)
            }
        }
    }
}
