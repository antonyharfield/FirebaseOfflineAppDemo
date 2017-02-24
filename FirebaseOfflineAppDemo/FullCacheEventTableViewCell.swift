//
//  EventNoCacheTableViewCell.swift
//  FirebaseOfflineAppDemo
//
//  Created by Ant on 24/02/2017.
//  Copyright © 2017 Apptitude. All rights reserved.
//

import UIKit
import FirebaseStorageCache

class FullCacheEventTableViewCell: EventTableViewCell {
    
    override func set(event: Event) {
        titleLabel.text = event.title
        let ref = Files.imageReference(imageName: event.imageName)
        backgroundImageView.setImage(storageReference: ref)
    }
    
}
