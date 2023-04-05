//
//  ListOfMoviesRouter.swift
//  Swift_Viper
//
//  Created by Rodo on 01/04/2023.
//

import Foundation
import UIKit

class ListOfMoviesRouter {
    
    // Llamar a la View para iniciar el camino
    func showListOfMovies(window: UIWindow?) {
        let view = ListOfMoviesView()
        let interactor = ListOfMoviesInteractor()
        let presenter = ListOfMoviesPresenter(listOfMoviesInteractor: interactor)
        
        presenter.ui = view
        view.presenter = presenter
        
        window?.rootViewController = view
        window?.makeKeyAndVisible()
    }
}
