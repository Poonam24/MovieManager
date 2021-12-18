//
//  Interactor.swift
//  MovieManager
//
//  Created by Poonam on 18/12/21.
//

import Foundation

class Interactor : InteractorInterface {
    
    weak var presenter : PresenterInterface?
    
//    init(withDb : DatabaseManager?) {
//        dbManager = withDb
//    }
//
    
    
    
    func fetchMovieList() {
        
        let type = MethodType.getmethod.rawValue;
        
        HttpClient.shared.callAPI(methodType: type, url: ARTICLE, callback: { [weak self] responseData, error in
            if (error == nil) {
                do {
                    guard let responseData = responseData else {
                        return
                    }
                    let parsedResponse = try JSONDecoder().decode(Modal.self, from: responseData)
                    
                   // self?.dbManager.saveArticleList(list: parsedResponse.content);
                    
                    self?.presenter?.movieFetchedSuccessful(list: parsedResponse.results
                                                            )
                } catch {
                    self?.presenter?.movieFetchedFailed(error: error)
                }
            } else {
               // self?.fetchFromLocalStorage()
            }
        })
    }
    
}
