//
//  Connection.swift
//  MVVMPractice
//
//  Created by shruti Mittal on 7/13/20.
//  Copyright © 2020 shruti Mittal. All rights reserved.
//

import Foundation
import UIKit

class Connection: NSObject {
    
    
    
    func makePostCall(request : URLRequest , success : @escaping(Data , HTTPURLResponse)-> Void , failure : @escaping(Error)-> Void )  {
        let configuration = URLSessionConfiguration.default
        let urlSession = URLSession(configuration: configuration)
        let requestTask = urlSession.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                if let err = error
                {
                    failure(err)
                }
                guard let requestData = data, let requestResponse = response as? HTTPURLResponse else {
                    failure(error!)
                    return
                }
                success(requestData, requestResponse)
            }
        }
        requestTask.resume()
        
    }

    
    
    let closure = {(name : String) -> String   in
        
         return name
    }
}
