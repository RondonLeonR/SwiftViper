//
//  DetailRouter.swift
//  Swift_Viper
//
//  Created by Rodo on 06/04/2023.
//

import Foundation
import UIKit

protocol DetailRouting: AnyObject {
    func showDetail(fromViewViewController: UIViewController,
                    withMovieId movieId: String)
}

class DetailRouter: DetailRouting {
    func showDetail(fromViewViewController: UIViewController,
                 withMovieId movieId: String) {
        let interactor = DetailInteractor()
        let presenter = DetailPresenter(movieId: movieId,
                                    interactor: interactor,
                                    mapper: MapperDetailMovieViewModel())
        
        let view = DetailView(presenter: presenter)
        presenter.ui = view
        
        fromViewViewController.present(view, animated: true)
    }
}
