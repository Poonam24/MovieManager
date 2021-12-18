//
//  Presenter.swift
//  MovieManager
//
//  Created by Poonam on 18/12/21.
//

import Foundation
import UIKit

class Presenter : PresenterInterface {
    
    
    weak var view : ViewInterface?
    var interactor : InteractorInterface?
    

    init(withView : ViewInterface, withInteractor : InteractorInterface) {
        view = withView
        interactor = withInteractor
    }
    
    func fetchMovieList() {
        interactor?.fetchMovieList();
    }
    
    func movieFetchedSuccessful(list: [Result]) {
        view?.updateView(withUpdatedData : list)
    }
    
    func movieFetchedFailed(error: Error) {
        view?.showError(error: error)
    }
    
    
    
}
