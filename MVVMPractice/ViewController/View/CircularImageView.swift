//
//  CircularImageView.swift
//  MVVMPractice
//
//  Created by shruti Mittal on 7/13/20.
//  Copyright © 2020 shruti Mittal. All rights reserved.
//

import UIKit

@IBDesignable
class CircularImageView: UIImageView {

    
    var cachedImage : NSCache = NSCache<AnyObject, UIImage>()
   override func awakeFromNib() {
        setupView()
    }
    
    
    func setupView(){
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
        
        
        
    }
    
    func setImagelazily(imageUrl: URL , placeHolderImage : String) {
        
        self.image = UIImage(named: placeHolderImage)
        if let cachedImg =  cachedImage.object(forKey: imageUrl as AnyObject)
        {
            self.image = cachedImg
            return
        }
       
        DispatchQueue.global().async {
            if let imageData = try? Data(contentsOf: imageUrl)
            {
                if let image = UIImage(data: imageData)
                {
                    DispatchQueue.main.async {[weak self] in
                        self?.cachedImage.setObject(image, forKey: imageUrl as AnyObject)
                        self?.image = image
                    }
                }
               
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
}
