//
//  BasicCacheEventTableViewCell.swift
//  FirebaseOfflineAppDemo
//
//  Created by Ant on 24/02/2017.
//  Copyright © 2017 Apptitude. All rights reserved.
//

import UIKit
import FirebaseStorage

let cache = NSCache<NSString, UIImage>()

class BasicCacheEventTableViewCell: EventTableViewCell {
    
    override func set(event: Event) {
        titleLabel.text = event.title
        
        // Create a storage reference
        let rootRef = FIRStorage.storage().reference()
        let imageRef = rootRef.child("images").child(event.imageName)
        
        let cacheKey = imageRef.fullPath as NSString
        
        if let cachedImage = cache.object(forKey: cacheKey) {
            self.backgroundImageView.image = cachedImage
        } else {
            // Download the URL
            imageRef.downloadURL { (url, error) in
                
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                // Download the file
                downloadImage(url: url!, completion: { (image) in
                    
                    // Set image on image view
                    DispatchQueue.main.async(execute: {
                        self.backgroundImageView.image = image
                    })
                    
                    // save cache
                    cache.setObject(image, forKey: cacheKey)
                })
            }
        }
    }

}
