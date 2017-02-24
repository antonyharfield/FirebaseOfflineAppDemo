//
//  Event.swift
//  FirebaseStorageCache
//
//  Created by Ant on 20/02/2017.
//  Copyright © 2017 Apptitude. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct Event {
    
    let id: String
    let title: String
    let imageName: String
    let pageName: String
    
}

extension Event {
    
    private struct key {
        static let title = "title"
        static let imageName = "imageName"
        static let pageName = "pageName"
    }
    
    init(id: String, contents: [String: AnyObject]) {
        self.id = id
        title = contents[key.title] as? String ?? ""
        imageName = contents[key.imageName] as? String ?? ""
        pageName = contents[key.pageName] as? String ?? ""
    }
    
}
