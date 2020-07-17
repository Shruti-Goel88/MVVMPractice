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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "SearchTableViewCell", bundle: Bundle.main)
        self.searchTableView.register(nib, forCellReuseIdentifier: "searchTableViewCell")
        
        self.searchTableView.delegate = self
        self.searchTableView.dataSource = self
        
        self.getUserData()
        
    }

    func getUserData()  {
        //
    }
}

extension StockSearchViewController : UITableViewDelegate , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : SearchTableViewCell = tableView.dequeueReusableCell(withIdentifier: "searchTableViewCell")! as! SearchTableViewCell
        cell.idLbl.text = "\(indexPath.row)"
        return cell
    }
    
    
}
