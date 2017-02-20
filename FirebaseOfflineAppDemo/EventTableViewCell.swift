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

    func set(event: Event) {
        contentView.backgroundColor = UIColor.yellow
        let ref = Files.imageReference(imageName: event.imageName)
        backgroundImageView.setImage(storageReference: ref)
    }

}
