//
//  ConnectionClientFactory.swift
//  MVVMPractice
//
//  Created by shruti Mittal on 8/6/20.
//  Copyright © 2020 shruti Mittal. All rights reserved.
//

import Foundation

class ConnectionClientFactory {
    
    func createClient() -> ConnectionProtocol {
        
        let env = ProcessInfo.processInfo.environment["ENV"]
        var client : ConnectionProtocol
        if env == "TEST"
        {
            client = MockConnectionClient()
        }
        else
        {
            client = Connection()
        }
        
        return client
    }
    
    
}
