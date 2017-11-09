//
//  EventTableViewCell.swift
//  FirebaseStorageCache
//
//  Created by Ant on 20/02/2017.
//  Copyright © 2017 Apptitude. All rights reserved.
//

import UIKit
import FirebaseStorage

class EventTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var backgroundImageView: UIImageView!
    
    override func prepareForReuse() {
        backgroundImageView.image = nil
    }
    
    func set(event: Event) {
        titleLabel.text = event.title
        
        // Create a storage reference
        let rootRef = Storage.storage().reference()
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
