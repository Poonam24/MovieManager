//
//  NetworkManager.swift

import Foundation
import UIKit
import Network
import SystemConfiguration

// MARK : Used Singleton design pattern
// As only once instance is required to check for internet connection

class NetworkManager {
    
   
    func isNetworkConnected() -> Bool {
        var networkConnected : Bool = true;
        
        if #available(iOS 12.0, *) {
            let monitor = NWPathMonitor()
            let queue = DispatchQueue.global(qos: .userInteractive)
            monitor.pathUpdateHandler = { pathUpdateHandler in
                if pathUpdateHandler.status == .satisfied {
                    networkConnected = true;
                } else {
                    networkConnected = false;
                }
            }
            monitor.start(queue: queue)
        }
        return networkConnected
    }
}

