//
//  HttpClient.swift
//  Merchandising
//
//  Created by Poonam on 27/11/21.
//

import Foundation
import UIKit

class HttpClient {
    
    private init() {}
    static let shared = HttpClient()
   
    
    typealias completeClosure = ( _ data: Data?, _ error: Error?)->Void
    private let session: URLSession = URLSession.shared
    private var request : URLRequest?
    private let internetConnectionAvailable : Bool = NetworkManager().isNetworkConnected()

    func createRequest(methodType : String, url : String) {
        guard let url = URL.init(string: (BASEURL + url)) else {
            return
        }
        request = URLRequest(url: url)
        request?.httpMethod = methodType;
    }
    
    func callAPI( methodType : String, url: String, callback: @escaping completeClosure ) {
        if(internetConnectionAvailable) {
            createRequest(methodType : methodType, url: url);
            guard let request = request else {
                return
            }
            let task = session.dataTask(with: request) { (data, response, error) in
                callback(data, error)
            }
            task.resume()
        } else {
            callback(nil, CustomError.noInternetConnection)
        }
        
    }
    
    func downloadImage(forId: Int, imageURL : URL, callback : @escaping completeClosure) {
        if(internetConnectionAvailable) {
            let downloadTask =  session.dataTask(with: imageURL) { data, response, error in
                if(error == nil) {
                    guard let data = data else {
                        return
                    }
                    callback(data, nil )
                } else {
                    callback(nil, error)
                }
            }
            downloadTask.resume();
        } else {
            callback(nil, CustomError.noInternetConnection)
        }
    }
}
