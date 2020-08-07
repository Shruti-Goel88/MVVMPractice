//
//  ConnectionProtocol.swift
//  MVVMPractice
//
//  Created by shruti Mittal on 8/6/20.
//  Copyright © 2020 shruti Mittal. All rights reserved.
//

import Foundation

protocol ConnectionProtocol
{
    func makeGetNetworkCall<T: Decodable>(urlString : String , resultType :T.Type, completionHandler : @escaping (Result<T , Error>)-> Void)

}
