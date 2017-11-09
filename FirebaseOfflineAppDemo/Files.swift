//
//  Files.swift
//  FirebaseStorageCache
//
//  Created by Ant on 20/02/2017.
//  Copyright © 2017 Apptitude. All rights reserved.
//

import Foundation
import FirebaseStorage

class Files {
    
    private static let storageRef = Storage.storage().reference()
    
    static func imageReference(imageName: String) -> StorageReference {
        return storageRef.child("images").child(imageName)
    }
    
    static func pageReference(pageName: String) -> StorageReference {
        return storageRef.child("pages").child(pageName)
    }
    
}
