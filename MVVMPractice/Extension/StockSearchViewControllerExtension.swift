//
//  StockSearchViewControllerExtension.swift
//  MVVMPractice
//
//  Created by shruti Mittal on 7/30/20.
//  Copyright © 2020 shruti Mittal. All rights reserved.
//

import UIKit

extension StockSearchViewController : UITableViewDelegate , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.stockUserArr?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell : SearchTableViewCell = tableView.dequeueReusableCell(withIdentifier: "searchTableViewCell")! as? SearchTableViewCell
        else
        {
            return SearchTableViewCell()
        }
        
        let userDetails  = (self.stockUserArr?[indexPath.row])!
        cell.dislaynameLbl.text = userDetails.username
        cell.idLbl.text = userDetails.displayName
        // lazy loading of image USING DISPATCHQUEUE GLOBAL ASYNC
        cell.userImageVw.setImagelazily(imageUrl: URL(string: userDetails.avatarUrl)!, placeHolderImage: "")
       
        
        // TODO: INFINITE SCROLL
        
        
        
        
        return cell
    }
    
    
}
