//
//  UIImageView+URL.swift
//  FirebaseOfflineAppDemo
//
//  Created by Ant on 24/02/2017.
//  Copyright © 2017 Apptitude. All rights reserved.
//

import UIKit

extension UIImageView {
    
    public func setImage(url: URL) {
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            
            guard let httpURLResponse = response as? HTTPURLResponse,
                error == nil, httpURLResponse.statusCode == 200 else {
                    print(error?.localizedDescription ?? "Error status code \((response as? HTTPURLResponse)?.statusCode)")
                    return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                print("No image data found")
                return
            }
            
            DispatchQueue.main.async(execute: {
                self.image = image
            })
        }).resume()
        
    }
    
}
