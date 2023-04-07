//
//  ListOfMoviesRouter.swift
//  Swift_Viper
//
//  Created by Rodo on 01/04/2023.
//

import Foundation
import UIKit

protocol ListOfMoviesRouting: AnyObject {
    var detailRouter: DetailRouting? { get }
    var listOfMoviesView: ListOfMoviesView? { get }
    
    func showListOfMovies(window: UIWindow?)
    func showDetailMovie(withMovieId movieId: String)
}

class ListOfMoviesRouter: ListOfMoviesRouting {
    
    var detailRouter: DetailRouting?
    var listOfMoviesView: ListOfMoviesView?
    
    // Llamar a la View para iniciar el camino
    func showListOfMovies(window: UIWindow?) {
        self.detailRouter = DetailRouter()
        // Desde aca puedo mockear la info llamando al (ListOfMoviesInteractorMock)
        let interactor = ListOfMoviesInteractor()
        let presenter = ListOfMoviesPresenter(listOfMoviesInteractor: interactor,
                                         router: self)
        
        listOfMoviesView = ListOfMoviesView(presenter: presenter)
        presenter.ui = listOfMoviesView
        //view.presenter = presenter
        
        window?.rootViewController = listOfMoviesView
        window?.makeKeyAndVisible()
    }
    
    func showDetailMovie(withMovieId movieId: String) {
        guard let fromViewController = listOfMoviesView else {
            return
        }
        
        detailRouter?.showDetail(fromViewViewController: fromViewController, withMovieId: movieId)
    }
}
