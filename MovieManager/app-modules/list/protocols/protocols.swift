//
//  protocols.swift
//  MovieManager
//
//  Created by Poonam on 18/12/21.
//

import Foundation

protocol ViewInterface : AnyObject {
    func updateView(withUpdatedData : [Result])
    func showError(error : Error);
    
}

protocol PresenterInterface : AnyObject {
    func fetchMovieList()
    func movieFetchedSuccessful(list : [Result])
    func movieFetchedFailed(error : Error)
}


protocol InteractorInterface : AnyObject {
    func fetchMovieList()
}

