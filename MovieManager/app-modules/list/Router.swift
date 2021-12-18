//
//  Router.swift
//  MovieManager
//
//  Created by Poonam on 18/12/21.
//

import Foundation
import UIKit

class Router {
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func buildBaseModule() -> UIViewController {
        
        guard let view = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController else {
            fatalError("Invalid view controller type")
        }
        
        //let dbManager = DatabaseManager()
        let interactor = Interactor()
        let presenter = Presenter(withView: view, withInteractor: interactor)
        interactor.presenter = presenter
        view.presenter = presenter
        
        return view
    }
}
