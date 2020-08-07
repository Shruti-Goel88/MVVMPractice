//
//  Connection.swift
//  MVVMPractice
//
//  Created by shruti Mittal on 7/13/20.
//  Copyright © 2020 shruti Mittal. All rights reserved.
//

import Foundation
import UIKit

class Connection: ConnectionProtocol {
    
        
     func makeGetNetworkCall<T: Decodable>(urlString : String , resultType :T.Type, completionHandler : @escaping (Result<T , Error>)-> Void)  {
        
        let urlRequest = URLRequest.init(url: URL(string: urlString)!)
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            DispatchQueue.main.async {
                if let err = error
                {
                    completionHandler(.failure(err))
                }
                guard let requestData = data, let requestResponse = response as? HTTPURLResponse else {
                    completionHandler(.failure(error!))
                    return
                }
                if requestResponse.statusCode == 200
                {
                    let decoder = JSONDecoder.init()
                    do {
                        let data =  try decoder.decode(resultType.self, from: requestData)
                        completionHandler(.success(data))
                    } catch let error {
                        completionHandler(.failure(error))
                    }
                }
            }
        }.resume()
        
    }
    
    static func makePostNetworkCall<T:Decodable>(urlString: String , resultType: T.Type , requestBody: Data, completionHandler: @escaping(Result<T, Error>)->Void)
    {
        var urlRequest = URLRequest.init(url: URL(string: urlString)!)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = requestBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            DispatchQueue.main.async {
                if let err = error
                {
                    completionHandler(.failure(err))
                }
                guard let requestData = data, let requestResponse = response as? HTTPURLResponse else {
                    completionHandler(.failure(error!))
                    return
                }
                
                    let decoder = JSONDecoder.init()
                    do {
                        let data =  try decoder.decode(resultType.self, from: requestData)
                        completionHandler(.success(data))
                    } catch let error {
                        completionHandler(.failure(error))
                    }
                
            }         }.resume()
        
    }
}
