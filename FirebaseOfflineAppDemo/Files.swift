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
    
    private static let storageRef = FIRStorage.storage().reference()
    
    static func imageReference(imageName: String) -> FIRStorageReference {
        return storageRef.child("images").child(imageName)
    }
    
    static func pageReference(pageName: String) -> FIRStorageReference {
        return storageRef.child("pages").child(pageName)
    }
    
}
