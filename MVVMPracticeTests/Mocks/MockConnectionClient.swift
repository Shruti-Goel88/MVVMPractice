//
//  MockConnectionClient.swift
//  MVVMPracticeTests
//
//  Created by shruti Mittal on 8/6/20.
//  Copyright © 2020 shruti Mittal. All rights reserved.
//

import Foundation
@testable import MVVMPractice

enum NetworkError :Error
{
    case networkError
    case badUrl
}
class MockConnectionClient: ConnectionProtocol {
    func makeGetNetworkCall<T: Decodable>(urlString : String , resultType :T.Type, completionHandler : @escaping (Result<T , Error>)-> Void)
    {
        
        guard let url = Bundle(for: MockConnectionClient.self).url(forResource: "StockUserResponse", withExtension: ".json"),
        let data = try? Data(contentsOf: url)
        else
         {
           return completionHandler(.failure(NetworkError.badUrl))
        }
        
        let users = try? JSONDecoder().decode(resultType.self ,from: data)
        completionHandler(.success(users!))
    }

}
