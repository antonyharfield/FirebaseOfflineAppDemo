//
//  EventTableViewCell.swift
//  FirebaseStorageCache
//
//  Created by Ant on 20/02/2017.
//  Copyright © 2017 Apptitude. All rights reserved.
//

import UIKit
import FirebaseStorageCache

class EventTableViewCell: UITableViewCell {
    
    @IBOutlet var backgroundImageView: UIImageView!
    
    override func prepareForReuse() {
        backgroundImageView.image = nil
    }

    func set(event: Event) {
        let ref = Files.imageReference(imageName: event.imageName)
        backgroundImageView.setImage(storageReference: ref)
    }

}
