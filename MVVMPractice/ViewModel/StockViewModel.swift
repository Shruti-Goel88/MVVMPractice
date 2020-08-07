//
//  StockViewModel.swift
//  MVVMPractice
//
//  Created by shruti Mittal on 7/23/20.
//  Copyright © 2020 shruti Mittal. All rights reserved.
//

import UIKit

struct  StockViewModel {
    var client: ConnectionProtocol
    
    init(client : ConnectionProtocol)
    {
        self.client = client
    }
    func getStockUsers(completion:@escaping (Stock)->Void)  {
        self.client.makeGetNetworkCall(urlString: Constants.stockUserApi , resultType : Stock.self) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let data):
                let stockDetails = data
                completion(stockDetails)
            }
        }
    }
   
}


