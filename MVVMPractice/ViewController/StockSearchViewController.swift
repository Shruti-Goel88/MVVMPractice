//
//  ViewController.swift
//  MVVMPractice
//
//  Created by shruti Mittal on 7/13/20.
//  Copyright © 2020 shruti Mittal. All rights reserved.
//

import UIKit

class StockSearchViewController: UIViewController {

    @IBOutlet weak var searchTableView: UITableView!
    var stockUserArr: [User]? = []
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
            
        let nib = UINib(nibName: "SearchTableViewCell", bundle: Bundle.main)
        self.searchTableView.register(nib, forCellReuseIdentifier: "searchTableViewCell")
        
        
        self.searchTableView.delegate = self
        self.searchTableView.dataSource = self
        
        self.getUserData()
        
    }

    func getUserData()  {
        
        let client = ConnectionClientFactory().createClient()
        let stockViewModel = StockViewModel(client: client)
        stockViewModel.getStockUsers { (stock) in
            self.stockUserArr = stock.users
            self.searchTableView.reloadData()
        }
        
        

    }
    func setUserData()  {
        
        let encoder = JSONEncoder.init()
        let userData = EmployeeRegisterationRequest.init(FirstName: "CodeCat", LastName: "15", Email: "codecat15@gmail.com", Password: "1234")
        let data = try? encoder.encode(userData)
        
        Connection.makePostNetworkCall(urlString: Constants.employeeRegisterApi, resultType: EmployeeRegistrationResponse.self, requestBody: data!) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let data):
                
                print("Registered username:  \(data.data.name)")
            
            }
        }
        
    }
    
}


