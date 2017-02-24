//
//  BasicCacheEventTableViewCell.swift
//  FirebaseOfflineAppDemo
//
//  Created by Ant on 24/02/2017.
//  Copyright © 2017 Apptitude. All rights reserved.
//

import Foundation
import FirebaseStorage

class BasicCacheEventTableViewCell: EventTableViewCell {
    
    override func set(event: Event) {
        // Create a storage reference
        let rootRef = FIRStorage.storage().reference()
        let imageRef = rootRef.child("images").child(event.imageName)
        
        // Download the URL
        imageRef.downloadURL { (url, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            // Download the file (and set on image view)
            self.backgroundImageView.setImage(url: url!)
        }
    }

}
